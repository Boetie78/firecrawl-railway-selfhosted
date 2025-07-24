# Deploying Firecrawl to Your Existing Railway Project

## Your Railway Project
**Project URL:** https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a  
**Environment:** Production (3a6358ad-4cd7-40bf-937d-97c4e54762d9)

## Quick Deployment to Existing Project

### Option 1: Automated Script (Recommended)
```bash
cd ~/firecrawl
./deploy-to-existing-railway.sh
```

### Option 2: Manual Steps

1. **Link to your project:**
   ```bash
   cd ~/firecrawl
   railway link
   # Select your project when prompted
   ```

2. **Check current services:**
   ```bash
   railway status
   railway service list
   ```

3. **Deploy Firecrawl services:**
   ```bash
   railway up --detach
   ```

4. **Get your API URL:**
   ```bash
   railway url --service api
   ```

5. **Test deployment:**
   ```bash
   ./test-firecrawl.sh $(railway url --service api)
   ```

## What Will Be Added to Your Project

The deployment will add these services to your existing Railway project:

- **🔥 api** - Main Firecrawl API server
- **👷 worker** - Background job processor  
- **🎭 playwright-service** - Web scraping engine
- **🗄️ redis** - Queue and cache storage

## Integration with Existing Services

**Benefits:**
- ✅ All services in one project (easier management)
- ✅ Shared networking (services can communicate)
- ✅ Centralized billing and monitoring
- ✅ Environment variable sharing

**Considerations:**
- Your existing services will remain unchanged
- Firecrawl services will be added alongside current ones
- You can manage all services from the same dashboard

## Environment Configuration

Your Firecrawl deployment will use these settings:

```bash
# Core settings
PORT=3002
HOST=0.0.0.0
USE_DB_AUTHENTICATION=false

# Admin access (CHANGE THIS!)
BULL_AUTH_KEY=firecrawl-railway-2024

# Optional: Add OpenAI integration
# railway env set OPENAI_API_KEY=your_key_here
```

## After Deployment

1. **Get your Firecrawl URL:**
   ```bash
   railway url --service api
   ```
   Should return something like: `https://api-production-xyz.up.railway.app`

2. **Access admin panel:**
   ```
   https://your-api-url/admin/firecrawl-railway-2024/queues
   ```

3. **Update local MCP configuration:**
   - Edit your MCP config file
   - Change Firecrawl base URL to your Railway URL
   - Restart MCP client

4. **Test everything works:**
   ```bash
   ./test-firecrawl.sh https://your-api-url.railway.app
   ```

## Cost Considerations

**Current Setup Impact:**
- Firecrawl will add ~4 services to your project
- Railway bills by total project usage
- Development usage: ~$10-20/month additional
- Production scaling: Based on actual usage

**vs Alternatives:**
- Much cheaper than per-API-call services
- Full control and customization
- No external dependencies

## Troubleshooting

**Deployment Issues:**
```bash
# Check service status
railway status

# View logs
railway logs --service api

# Restart services if needed
railway restart --service api
```

**MCP Connection Issues:**
- Ensure Railway URL is accessible
- Check MCP configuration syntax
- Test Railway API with curl first
- Restart MCP client after changes

## Next Steps

1. ✅ Run the deployment script
2. ✅ Get your API URL  
3. ✅ Update MCP configuration
4. ✅ Test Firecrawl MCP functions
5. ✅ Start building with full Firecrawl features!

Ready to deploy to your existing Railway project? 🚀
