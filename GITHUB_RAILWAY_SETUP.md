# GitHub → Railway Setup Guide

## Quick Setup (Recommended)

### Step 1: Create Your GitHub Repository
1. Go to: https://github.com/new
2. Repository name: `firecrawl-railway-selfhosted`
3. Description: `Firecrawl self-hosted on Railway with MCP integration`
4. Make it **Public** (recommended for easy Railway integration)
5. **DO NOT** initialize with README (we have files already)
6. Click "Create repository"

### Step 2: Run the Setup Script
```bash
cd ~/firecrawl
./setup-github-repo.sh
```

### Step 3: Connect GitHub to Railway
1. Go to your Railway project: https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a
2. Click **"New Service"**
3. Select **"GitHub Repo"**
4. Choose your repository: `YOUR_USERNAME/firecrawl-railway-selfhosted`
5. Railway will automatically detect `docker-compose.yaml`
6. Click **"Deploy"**

### Step 4: Railway Auto-Deployment
Railway will automatically create these services:
- **api** - Main Firecrawl API server
- **worker** - Background job processor  
- **playwright-service** - Web scraping engine
- **redis** - Queue and cache storage

### Step 5: Get Your API URL
- Go to Railway dashboard
- Click on the **"api"** service
- Copy the public URL (something like: `https://api-production-xyz.up.railway.app`)

### Step 6: Test Your Deployment
```bash
./test-firecrawl.sh https://your-api-url.railway.app
```

## Manual Method (Alternative)

If you prefer to do it manually:

```bash
cd ~/firecrawl

# Remove old remote
git remote remove origin

# Add your repository (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/firecrawl-railway-selfhosted.git

# Push to your repository
git push -u origin main
```

## Benefits of GitHub → Railway Workflow

✅ **Auto-deployment** - Push to GitHub = automatic Railway deploy  
✅ **Version control** - All changes tracked and backed up  
✅ **Easy rollbacks** - Roll back to any version instantly  
✅ **Team collaboration** - Share repository with team members  
✅ **Professional workflow** - Industry standard approach  
✅ **Railway dashboard** - Monitor all services in one place  
✅ **Deployment history** - See all deployments and their status  

## After Deployment

1. **Update MCP Configuration** (see `MCP_CONFIG.md`)
2. **Access Admin Panel:** `https://your-api-url/admin/firecrawl-railway-2024/queues`  
3. **Test all MCP functions** - should work perfectly!
4. **Start building** with full Firecrawl functionality

## Troubleshooting

**Repository Creation Issues:**
- Make sure you're logged into GitHub
- Don't initialize with README/license (we have files)
- Public repos are easier for Railway integration

**Railway Connection Issues:**
- Ensure repository is public or Railway has access
- Check Railway GitHub app permissions
- Verify `docker-compose.yaml` is in repository root

**Deployment Issues:**
- Check Railway logs in dashboard
- Verify environment variables are set
- Make sure all services are starting

---

**Ready to set up your GitHub repository?** 

Run: `./setup-github-repo.sh` 🚀
