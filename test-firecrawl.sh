#!/bin/bash

# Test Firecrawl Railway Deployment
# Usage: ./test-firecrawl.sh https://your-api-url.railway.app

if [ -z "$1" ]; then
    echo "❌ Please provide your Railway API URL"
    echo "Usage: ./test-firecrawl.sh https://your-api-url.railway.app"
    exit 1
fi

API_URL=$1
echo "🧪 Testing Firecrawl deployment at: $API_URL"

# Test 1: Basic scrape
echo "Test 1: Basic scraping..."
curl -X POST "$API_URL/v1/scrape" \
     -H 'Content-Type: application/json' \
     -d '{"url": "https://example.com"}' \
     -w "\nStatus: %{http_code}\n"

echo ""
echo "Test 2: API health check..."
curl -X GET "$API_URL/health" -w "\nStatus: %{http_code}\n"

echo ""
echo "📊 Admin Panel: $API_URL/admin/firecrawl-railway-2024/queues"
echo "🎉 If you see data above, your Firecrawl deployment is working!"

echo ""
echo "📝 Next: Update your local MCP configuration to use: $API_URL"
