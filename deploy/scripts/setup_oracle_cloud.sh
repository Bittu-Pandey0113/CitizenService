#!/usr/bin/env bash
# ==============================================================================
# Oracle Cloud Always Free Setup Script for Citizen Service Portal
# Supports: Ubuntu 22.04 LTS / Ubuntu 24.04 LTS (x86_64 or ARM64 Ampere A1)
# ==============================================================================

set -euo pipefail

echo "=========================================================="
echo " Starting Citizen Service Portal Production Setup on OCI  "
echo "=========================================================="

DB_NAME="citizen_service"
DB_USER="citizen_user"
DB_PASS="CitizenService_SecurePass2026!"
APP_DIR="/opt/citizenservice"

# 1. Update system packages
echo "[1/7] Updating package index..."
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl wget unzip git debian-keyring debian-archive-keyring apt-transport-https iptables-persistent

# 2. Configure Host Firewall (OCI Ubuntu iptables fix)
echo "[2/7] Configuring firewall for HTTP (80) and HTTPS (443)..."
# Oracle Linux/Ubuntu images in OCI have strict iptables rules that reject port 80/443 by default
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT || sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 443 -j ACCEPT || sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT
sudo netfilter-persistent save

if command -v ufw >/dev/null 2>&1; then
    sudo ufw allow 22/tcp || true
    sudo ufw allow 80/tcp || true
    sudo ufw allow 443/tcp || true
fi

# 3. Install OpenJDK 21 (Full JDK required for Tomcat Jasper JSP runtime compilation)
echo "[3/7] Installing OpenJDK 21..."
sudo apt-get install -y openjdk-21-jdk
java -version

# 4. Install and configure MySQL 8 Server
echo "[4/7] Installing MySQL 8 Server..."
sudo apt-get install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql

# Ensure MySQL only listens on localhost for security
echo "Configuring MySQL security and user..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"
sudo mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED WITH mysql_native_password BY '${DB_PASS}' || CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "ALTER USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Import schema and data if present
if [ -f "${APP_DIR}/database/production_database_init.sql" ]; then
    echo "Importing initial database schema and seed records..."
    sudo mysql "${DB_NAME}" < "${APP_DIR}/database/production_database_init.sql"
    echo "Database import successful!"
fi

# 5. Install Caddy Web Server (Reverse proxy with automatic HTTPS)
echo "[5/7] Installing Caddy Web Server..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg --yes
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt-get update -y
sudo apt-get install -y caddy

# 6. Configure Application Files & Permissions
echo "[6/7] Setting up application directories..."
sudo mkdir -p "${APP_DIR}"
sudo chown -R ubuntu:ubuntu "${APP_DIR}"

# Copy systemd service file if present
if [ -f "${APP_DIR}/deploy/systemd/citizenservice.service" ]; then
    sudo cp "${APP_DIR}/deploy/systemd/citizenservice.service" /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable citizenservice
fi

# Copy Caddyfile if present
if [ -f "${APP_DIR}/deploy/caddy/Caddyfile" ]; then
    sudo cp "${APP_DIR}/deploy/caddy/Caddyfile" /etc/caddy/Caddyfile
    sudo systemctl reload caddy || sudo systemctl restart caddy
fi

echo "=========================================================="
echo " OCI Instance Environment Preparation Complete!          "
echo "=========================================================="
