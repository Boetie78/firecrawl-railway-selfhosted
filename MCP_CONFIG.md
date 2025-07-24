# Connecting Local MCP to Railway Firecrawl

## After Railway Deployment

Once your Firecrawl is deployed to Railway, you need to update your local MCP configuration to connect to it.

### 1. Get Your Railway URL

After running the deployment script, Railway will give you a URL like:
```
https://api-production-abc123.up.railway.app
```

### 2. Update MCP Configuration

Your MCP configuration needs to be updated to use your Railway URL instead of localhost.

**Typical MCP Config Location:**
- macOS: `~/.config/mcp/mcp.json` or similar
- Look for Firecrawl MCP settings

**Update the base URL from:**
```json
{
  "baseUrl": "http://localhost:8000"
}
```

**To your Railway URL:**
```json
{
  "baseUrl": "https://your-api-service.railway.app"
}
```

### 3. Test the Connection

After updating your MCP config, test it:

```bash
# Test from command line first
./test-firecrawl.sh https://your-api-service.railway.app

# Then test your MCP
```

### 4. MCP Configuration Examples

**If your MCP config looks like this:**
```json
{
  "firecrawl": {
    "command": "firecrawl-mcp",
    "args": [
      "--api-url", "http://localhost:8000"
    ]
  }
}
```

**Change to:**
```json
{
  "firecrawl": {
    "command": "firecrawl-mcp", 
    "args": [
      "--api-url", "https://your-railway-url.railway.app"
    ]
  }
}
```

### 5. Restart MCP Client

After configuration changes:
1. Restart your MCP client
2. Test Firecrawl MCP functions
3. Verify scraping works from local tools

## Benefits of This Setup

✅ **Local Development:** Your MCP tools can now use full Firecrawl features  
✅ **Cost Control:** Railway usage-based pricing vs per-API-call  
✅ **No Docker Locally:** Clean local development environment  
✅ **Easy Scaling:** Scale Railway instance as needed  
✅ **Testing Environment:** Perfect for development before production  

## Troubleshooting

**MCP Connection Issues:**
- Verify Railway URL is accessible via browser
- Check MCP configuration syntax
- Restart MCP client after config changes
- Test Railway API directly with curl first

**Railway Service Issues:**  
- Check Railway dashboard for service status
- View logs: `railway logs`
- Restart services if needed: `railway restart`
