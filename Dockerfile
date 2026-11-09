# ==============================================================================
# Production Dockerfile for Citizen Service Portal (Spring Boot 4 + JSP + Tomcat)
# Multi-stage build — JDK 21 for Tomcat Jasper JSP compilation at runtime
# Optimized for Render Free Tier: 512MB RAM, port $PORT
# ==============================================================================

# Stage 1: Build War
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /build

COPY pom.xml ./
RUN mvn dependency:go-offline -B || true

COPY src ./src
RUN mvn clean package -Dmaven.test.skip=true -o || mvn clean package -DskipTests

# Stage 2: Production Runtime (Full JDK required for Tomcat Jasper JSP runtime compilation)
FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app

# Create unprivileged system user
RUN groupadd -r spring && useradd -r -g spring spring

# Copy built war
COPY --from=builder /build/target/citizenservice-*.war /app/app.war

RUN chown -R spring:spring /app
USER spring

EXPOSE 8080 10000

# Use Serial GC (lowest memory), tight heap to stay under 512MB total
# PORT env var injected by Render at runtime (default 10000)
ENV PORT=10000
ENTRYPOINT ["java", \
  "-XX:+UseSerialGC", \
  "-Xms32m", \
  "-Xmx192m", \
  "-XX:MaxMetaspaceSize=80m", \
  "-XX:CompressedClassSpaceSize=24m", \
  "-Xss256k", \
  "-XX:+ExitOnOutOfMemoryError", \
  "-Djava.security.egd=file:/dev/./urandom", \
  "-jar", "/app/app.war"]
