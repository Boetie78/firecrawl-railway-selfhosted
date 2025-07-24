# Firecrawl on Railway Deployment Guide

## Quick Railway Deployment

### 1. Prerequisites
- Railway account (https://railway.app)
- Railway CLI installed: `npm install -g @railway/cli`

### 2. Deploy to Railway

```bash
# Navigate to firecrawl directory
cd ~/firecrawl

# Login to Railway
railway login

# Create new Railway project
railway create firecrawl-selfhosted

# Deploy all services from docker-compose
railway up --detach

# Set environment variables (if needed)
railway env set OPENAI_API_KEY=your_key_here
```

### 3. Get Your Firecrawl URL

After deployment, Railway will provide you with URLs for each service:
- Main API: `https://your-api-service.railway.app`
- Admin Panel: `https://your-api-service.railway.app/admin/firecrawl-railway-2024/queues`

### 4. Test Your Deployment

```bash
# Test the API
curl -X POST https://your-api-service.railway.app/v1/scrape \
     -H 'Content-Type: application/json' \
     -d '{"url": "https://example.com"}'
```

### 5. Configure Local MCP

Update your MCP configuration to use:
```
https://your-api-service.railway.app
```

## Railway Advantages

- ✅ No Docker Desktop needed locally
- ✅ Automatic scaling
- ✅ Built-in monitoring
- ✅ Easy environment management
- ✅ Cost-effective for development/testing
- ✅ Simple production scaling

## Costs

Railway pricing is usage-based:
- Development: ~$5-20/month
- Production: Scales with usage
- Much cheaper than per-API-call services for testing

