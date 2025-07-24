#!/bin/bash

# Firecrawl Railway Deployment Script
echo "🚀 Deploying Firecrawl to Railway..."

# Step 1: Login to Railway (interactive)
echo "Step 1: Logging in to Railway..."
railway login

# Step 2: Create new project
echo "Step 2: Creating Railway project..."
railway create firecrawl-selfhosted

# Step 3: Deploy using docker-compose
echo "Step 3: Deploying services..."
railway up --detach

# Step 4: Show deployment status
echo "Step 4: Checking deployment status..."
railway status

# Step 5: Get service URLs
echo "🎉 Deployment complete!"
echo "Your Firecrawl API will be available at:"
railway url --service api

echo ""
echo "📊 Admin Panel will be available at:"
echo "https://your-api-url/admin/firecrawl-railway-2024/queues"

echo ""
echo "🧪 Test your deployment with:"
echo 'curl -X POST https://your-api-url/v1/scrape -H "Content-Type: application/json" -d '\''{"url": "https://example.com"}'\'''

echo ""
echo "✅ Next step: Update your local MCP configuration with the Railway URL"
