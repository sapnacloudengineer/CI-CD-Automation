#!/bin/bash

# Go to project folder
cd ~/CI-CD-Automation

# Pull latest code
git pull origin master

# Stop and remove OLD container
docker stop myapp || true
docker rm myapp || true

# Also stop/remove if new container already exists
docker stop mywebsite || true
docker rm mywebsite || true

# Build new image
docker build -t mywebsite .

# Run new container
docker run -d -p 80:80 --name mywebsite mywebsite
