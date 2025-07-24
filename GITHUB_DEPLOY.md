# GitHub + Railway Auto-Deploy Setup

If you prefer to deploy via GitHub instead of direct Railway CLI:

## Steps:

### 1. Push to GitHub
```bash
cd ~/firecrawl

# Initialize git and push to your GitHub
git add .
git commit -m "Add Firecrawl setup for Railway"
git push origin main
```

### 2. Connect GitHub to Railway
1. Go to your Railway project: https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a
2. Click "New Service" 
3. Select "GitHub Repo"
4. Connect your firecrawl repository
5. Railway will auto-deploy from your repo

### 3. Configure Services
Railway will detect the `docker-compose.yaml` and set up:
- API service
- Worker service  
- Playwright service
- Redis service

### Benefits:
- ✅ Auto-deploy on git push
- ✅ Easy rollbacks
- ✅ Version control integration
- ✅ No CLI needed after setup

### Drawbacks:
- Takes longer initially
- Need to push to GitHub first
- Less direct control
