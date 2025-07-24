# Firecrawl Self-Hosted on Railway

This repository contains a complete Firecrawl setup optimized for Railway deployment with GitHub integration.

## 🚀 Quick Railway Deployment from GitHub

### Prerequisites
- Railway account (https://railway.app)
- This repository on GitHub

### Deployment Steps

1. **Fork/Clone this repository to your GitHub**
2. **Connect to Railway:**
   - Go to your Railway project: https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a
   - Click "New Service" → "GitHub Repo"
   - Select this repository
   - Railway auto-detects `docker-compose.yaml` and deploys all services

3. **Services Deployed:**
   - 🔥 **API Server** - Main Firecrawl API
   - 👷 **Worker** - Background job processor
   - 🎭 **Playwright** - Web scraping engine
   - 🗄️ **Redis** - Queue and cache storage

4. **Get your API URL:**
   - Railway dashboard will show service URLs
   - Use the API service URL for your MCP configuration

5. **Access Admin Panel:**
   ```
   https://your-api-url.railway.app/admin/firecrawl-railway-2024/queues
   ```

## 🔧 Configuration Files

- **`.env`** - Environment variables (pre-configured)
- **`docker-compose.yaml`** - Service definitions
- **`MCP_CONFIG.md`** - Connect local MCP to Railway
- **`test-firecrawl.sh`** - Test deployment script

## 💡 Benefits of This Setup

✅ **Auto-deployment** - Push to GitHub = auto-deploy to Railway  
✅ **Version control** - All changes tracked  
✅ **Easy rollbacks** - Instant rollback to any version  
✅ **Team collaboration** - Share repository with team  
✅ **Professional workflow** - Industry standard approach  
✅ **Cost effective** - Usage-based Railway pricing  

## 🧪 Testing Your Deployment

After deployment, test with:
```bash
./test-firecrawl.sh https://your-api-url.railway.app
```

## 📱 MCP Integration

See `MCP_CONFIG.md` for connecting your local MCP to the Railway deployment.

## 📊 Monitoring

- **Railway Dashboard** - Service status, logs, metrics
- **Admin Panel** - Queue monitoring and job status
- **GitHub Actions** - Can be added for CI/CD

## 💰 Cost Optimization

**Development:** ~$10-20/month  
**Production:** Scales with usage  
**vs Cloud APIs:** Much cheaper for regular development/testing

## 🔒 Security

- No API keys required for self-hosted instance
- All data processing happens in your Railway environment
- Optional OpenAI integration for AI features

## 📚 Documentation

- **`SELF_HOST.md`** - Original Firecrawl documentation
- **`MCP_CONFIG.md`** - MCP configuration guide
- **`RAILWAY_DEPLOY.md`** - Railway-specific deployment notes

## 🆘 Support

- **Firecrawl Issues:** https://github.com/mendableai/firecrawl/issues
- **Railway Support:** https://railway.app/help
- **MCP Integration:** See local MCP documentation

---

**Ready to deploy?** Just connect this GitHub repo to your Railway project! 🎯
