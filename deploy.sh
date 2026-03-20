#!/bin/bash

echo "🚀 START DEPLOY"

cd ~/CI-CD-Automation || { echo "❌ Folder not found"; exit 1; }

echo "📂 Current files:"
ls -la

echo "🔄 Pulling latest code"
git pull origin master || { echo "❌ Git pull failed"; exit 1; }

echo "🛑 Stopping old container"
docker stop mywebsite || true
docker rm mywebsite || true

echo "🏗️ Building Docker image"
docker build -t my-website . || { echo "❌ Docker build failed"; exit 1; }

echo "🚀 Running container"
docker run -d -p 80:80 --name mywebsite my-website || { echo "❌ Docker run failed"; exit 1; }

echo "🎉 DEPLOY SUCCESS"
