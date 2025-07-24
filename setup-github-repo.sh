#!/bin/bash

# Setup Your Own Firecrawl Repository for Railway
echo "🔧 Setting up your own Firecrawl repository..."
echo "============================================="
echo ""

echo "📋 STEP 1: Create a new repository on GitHub"
echo ""
echo "Go to: https://github.com/new"
echo "Repository name: firecrawl-railway-selfhosted"
echo "Description: Firecrawl self-hosted on Railway with MCP integration"
echo "Make it: Public (recommended) or Private"
echo "DO NOT initialize with README (we already have files)"
echo ""
read -p "Press Enter after creating the repository on GitHub..."

echo ""
echo "📋 STEP 2: Get your repository URL"
echo "After creating, GitHub will show you the repository URL like:"
echo "https://github.com/YOUR_USERNAME/firecrawl-railway-selfhosted.git"
echo ""
read -p "Enter your GitHub username: " GITHUB_USERNAME

# Set the new repository URL
NEW_REPO="https://github.com/$GITHUB_USERNAME/firecrawl-railway-selfhosted.git"
echo "Your repository URL: $NEW_REPO"
echo ""

echo "📋 STEP 3: Update git remote"
echo "Removing old remote and adding your repository..."
git remote remove origin
git remote add origin "$NEW_REPO"

echo ""
echo "📋 STEP 4: Push to your repository"
echo "Command: git push -u origin main"
echo ""
read -p "Press Enter to push to your GitHub repository..."
git push -u origin main

echo ""
echo "🎉 SUCCESS! Your Firecrawl repository is now on GitHub!"
echo ""
echo "Repository URL: https://github.com/$GITHUB_USERNAME/firecrawl-railway-selfhosted"
echo ""
echo "📋 NEXT STEPS:"
echo "1. Go to your Railway project: https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a"
echo "2. Click 'New Service' → 'GitHub Repo'"
echo "3. Select: $GITHUB_USERNAME/firecrawl-railway-selfhosted"
echo "4. Railway will auto-deploy all services!"
echo ""
echo "✅ After deployment, get your API URL from Railway dashboard"
echo "✅ Update your MCP configuration (see MCP_CONFIG.md)"
echo "✅ Test with: ./test-firecrawl.sh YOUR_API_URL"
