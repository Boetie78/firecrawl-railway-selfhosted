#!/bin/bash

# Step-by-step Railway deployment with prompts
echo "🚀 Firecrawl Railway Deployment - Step by Step"
echo "=============================================="
echo ""

echo "📋 STEP 1: Link to your Railway project"
echo "When prompted, select your existing project"
echo "Command: railway link"
echo ""
read -p "Press Enter when ready to link to Railway project..."
railway link

echo ""
echo "📋 STEP 2: Verify project connection"
echo "Command: railway status"
echo ""
read -p "Press Enter to check project status..."
railway status

echo ""
echo "📋 STEP 3: Deploy Firecrawl services"
echo "This will add Firecrawl to your existing Railway project"
echo "Command: railway up --detach"
echo ""
read -p "Press Enter to start deployment..."
railway up --detach

echo ""
echo "📋 STEP 4: Check deployment status"
echo "Command: railway status"
echo ""
read -p "Press Enter to check deployment status..."
railway status

echo ""
echo "📋 STEP 5: Get your API URL"
echo "Command: railway url --service api"
echo ""
read -p "Press Enter to get your API URL..."
API_URL=$(railway url --service api)
echo "🎉 Your Firecrawl API URL: $API_URL"

echo ""
echo "📋 STEP 6: Test your deployment"
if [ ! -z "$API_URL" ]; then
    echo "Testing your deployment..."
    ./test-firecrawl.sh "$API_URL"
else
    echo "Please run: ./test-firecrawl.sh YOUR_API_URL"
fi

echo ""
echo "✅ Deployment Complete!"
echo "📊 Admin Panel: $API_URL/admin/firecrawl-railway-2024/queues"
echo "📝 Next: Update your MCP configuration (see MCP_CONFIG.md)"
