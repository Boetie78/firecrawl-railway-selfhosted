#!/bin/bash

# Deploy Firecrawl to Your Existing Railway Project
echo "🚀 Deploying Firecrawl to your existing Railway project..."
echo "Project URL: https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a"

# Step 1: Link to your existing project
echo "Step 1: Linking to your Railway project..."
echo "Select your project when prompted..."
railway link

# Step 2: Check current services
echo "Step 2: Checking current services..."
railway status

# Step 3: Deploy Firecrawl services
echo "Step 3: Deploying Firecrawl services..."
echo "This will add Firecrawl to your existing project..."

# Deploy using docker-compose to your existing project
railway up --detach

# Step 4: Set environment if needed
echo "Step 4: Setting environment variables..."
# Uncomment and set if you have an OpenAI key
# railway env set OPENAI_API_KEY=your_key_here

# Step 5: Show deployment status
echo "Step 5: Checking deployment status..."
railway status

# Step 6: Get service URLs
echo "🎉 Deployment complete!"
echo ""
echo "Your services in this Railway project:"
railway service list

echo ""
echo "Get your Firecrawl API URL:"
railway url --service api

echo ""
echo "📊 Admin Panel will be available at:"
echo "https://your-api-url/admin/firecrawl-railway-2024/queues"

echo ""
echo "🧪 Test your deployment with:"
echo "./test-firecrawl.sh \$(railway url --service api)"

echo ""
echo "✅ Next: Update your local MCP configuration with the Railway URL"
echo "✅ See MCP_CONFIG.md for configuration instructions"
