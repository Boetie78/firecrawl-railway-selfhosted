# Railway Multi-Service Deployment Guide

Railway works best with individual services rather than docker-compose. Let's deploy each Firecrawl component as a separate Railway service.

## 🚀 Step-by-Step Railway Deployment

### Step 1: Deploy Redis Service
1. Go to your Railway project: https://railway.com/project/f4cba472-90a4-414d-90c5-657e13b78c7a
2. Click **"New Service"** → **"Database"** → **"Add Redis"**
3. Name it: `firecrawl-redis`
4. Railway will provide a `REDIS_URL` environment variable

### Step 2: Deploy Playwright Service
1. Click **"New Service"** → **"GitHub Repo"**
2. Select: `Boetie78/firecrawl-railway-selfhosted`
3. **Service Name:** `playwright-service`
4. **Root Directory:** `apps/playwright-service-ts`
5. Railway will auto-detect Node.js and deploy

### Step 3: Deploy API Service
1. Click **"New Service"** → **"GitHub Repo"**
2. Select: `Boetie78/firecrawl-railway-selfhosted`
3. **Service Name:** `firecrawl-api`
4. **Root Directory:** `apps/api`
5. Railway will auto-detect Node.js and deploy

### Step 4: Deploy Worker Service
1. Click **"New Service"** → **"GitHub Repo"**
2. Select: `Boetie78/firecrawl-railway-selfhosted`
3. **Service Name:** `firecrawl-worker`
4. **Root Directory:** `apps/api`
5. **Start Command:** `pnpm run workers`

### Step 5: Configure Environment Variables

For **firecrawl-api** service:
```bash
PORT=3002
HOST=0.0.0.0
USE_DB_AUTHENTICATION=false
BULL_AUTH_KEY=firecrawl-railway-2024
REDIS_URL=${{firecrawl-redis.REDIS_URL}}
REDIS_RATE_LIMIT_URL=${{firecrawl-redis.REDIS_URL}}
PLAYWRIGHT_MICROSERVICE_URL=https://${{playwright-service.RAILWAY_PUBLIC_DOMAIN}}/scrape
```

For **firecrawl-worker** service:
```bash
USE_DB_AUTHENTICATION=false
REDIS_URL=${{firecrawl-redis.REDIS_URL}}
REDIS_RATE_LIMIT_URL=${{firecrawl-redis.REDIS_URL}}
PLAYWRIGHT_MICROSERVICE_URL=https://${{playwright-service.RAILWAY_PUBLIC_DOMAIN}}/scrape
```

For **playwright-service**:
```bash
PORT=3000
```

## ✅ Benefits of This Approach

✅ **Better resource management** - Scale each service independently
✅ **Easier debugging** - Isolate issues to specific services
✅ **Railway-native** - Works with Railway's service model
✅ **Better monitoring** - Individual service metrics
✅ **Cost optimization** - Pay only for what each service uses

## 🧪 Testing Your Deployment

Once all services are deployed:

1. **Get your API URL** from the `firecrawl-api` service
2. **Test the deployment:**
   ```bash
   ./test-firecrawl.sh https://firecrawl-api-production-xyz.up.railway.app
   ```

## 🔗 Service URLs

After deployment, you'll have:
- **API:** `https://firecrawl-api-production-xyz.up.railway.app`
- **Admin Panel:** `https://firecrawl-api-production-xyz.up.railway.app/admin/firecrawl-railway-2024/queues`
- **Playwright:** `https://playwright-service-production-xyz.up.railway.app`
- **Redis:** Internal Railway database

## 🔧 Troubleshooting

**Service Won't Start:**
- Check Railway logs for each service
- Verify environment variables are set correctly
- Ensure root directory is correct for each service

**Services Can't Connect:**
- Verify `REDIS_URL` variables are set
- Check `PLAYWRIGHT_MICROSERVICE_URL` is correct
- Make sure all services are in the same Railway project

**Build Failures:**
- Check that `package.json` exists in the root directory for each service
- Verify Node.js version compatibility
- Check Railway build logs

This approach is much more Railway-native and will work better than docker-compose!
