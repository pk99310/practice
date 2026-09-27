#!/usr/bin/env bash

set -euo pipefail

VM_NAME="${VM_NAME:-devops-linux}"
VM_PROJECT_DIR="/home/ubuntu/practice-container"
MULTIPASS="${MULTIPASS:-/usr/local/bin/multipass}"
JAR_PATH="target/practice-0.0.1-SNAPSHOT.jar"

echo "Building the Spring Boot JAR..."
mvn clean package

echo "Preparing the Ubuntu VM..."
"$MULTIPASS" exec "$VM_NAME" -- mkdir -p "$VM_PROJECT_DIR"

echo "Copying application files into Ubuntu..."
"$MULTIPASS" transfer Dockerfile "$VM_NAME:$VM_PROJECT_DIR/Dockerfile"
"$MULTIPASS" transfer compose.yaml "$VM_NAME:$VM_PROJECT_DIR/compose.yaml"
"$MULTIPASS" transfer "$JAR_PATH" "$VM_NAME:$VM_PROJECT_DIR/app.jar"

echo "Building and starting the container..."
"$MULTIPASS" exec "$VM_NAME" -- bash -lc "cd '$VM_PROJECT_DIR' && docker compose up --build -d"

echo "Checking the deployed API..."
response=$("$MULTIPASS" exec "$VM_NAME" -- curl --fail --silent http://localhost:8081/hello)
echo "API response: $response"
