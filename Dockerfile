# ==============================================================================
# Production Dockerfile for Citizen Service Portal (Spring Boot 4 + JSP + Tomcat)
# Multi-stage build with full OpenJDK 21 for Tomcat Jasper runtime JSP compilation
# ==============================================================================

# Stage 1: Build War
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /build

COPY pom.xml ./
RUN mvn dependency:go-offline -B || true

COPY src ./src
RUN mvn clean package -Dmaven.test.skip=true -o || mvn clean package -DskipTests

# Stage 2: Production Runtime (Optimized for 512MB RAM free tier)
FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app

# Create unprivileged system user
RUN groupadd -r spring && useradd -r -g spring spring

# Copy built war
COPY --from=builder /build/target/citizenservice-*.war /app/app.war

RUN chown -R spring:spring /app
USER spring

EXPOSE 8080 10000

ENTRYPOINT ["java", "-XX:+UseSerialGC", "-Xms64m", "-Xmx224m", "-XX:MaxMetaspaceSize=96m", "-XX:CompressedClassSpaceSize=32m", "-Xss512k", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.war"]
