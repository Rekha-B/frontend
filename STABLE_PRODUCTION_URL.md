# Stable Production URL

## Current Production URL

Your app has a **stable production URL** that doesn't change:

**🌐 Production URL:** `https://frontend-green-ten-90.vercel.app`

This URL stays the same and gets updated automatically with each deployment.

## Understanding Vercel URLs

Vercel creates different types of URLs:

1. **Production URL** (Stable) - `https://frontend-green-ten-90.vercel.app`
   - This URL stays the same
   - Gets updated with each `vercel --prod` deployment
   - This is your main production endpoint

2. **Preview URLs** (Temporary) - `https://frontend-<hash>-rekhas-projects-c9cf56c7.vercel.app`
   - These change with each deployment
   - Used for testing before production
   - Can be ignored

## Deploying to Stable Production URL

Always use the `--prod` flag to update the stable production URL:

```bash
cd frontend
vercel --prod
```

This will update `https://frontend-green-ten-90.vercel.app` with your latest changes.

## Setting Up a Custom Domain (Optional)

If you want a more readable, stable URL like `https://my-app.vercel.app`:

### Method 1: Via Vercel Dashboard (Recommended)

1. Go to [Vercel Dashboard](https://vercel.com/rekhas-projects-c9cf56c7/frontend/settings/domains)
2. Click on **Domains** in the settings
3. Add your custom domain (e.g., `my-app.vercel.app`)
4. Follow the instructions to configure DNS

### Method 2: Via Vercel CLI

```bash
cd frontend
vercel domains add your-custom-domain.com
```

### Method 3: Update Project Name

You can also change the project name in Vercel to get a more readable URL:

1. Go to [Vercel Dashboard](https://vercel.com/rekhas-projects-c9cf56c7/frontend/settings)
2. Click on **General** settings
3. Change the **Project Name** to something more readable
4. The URL will update to `https://your-new-name.vercel.app`

## Verifying Production URL

Check your current production URL:

```bash
cd frontend
vercel project ls
```

## Quick Deploy Script

Create a script to always deploy to production:

**Windows PowerShell (`deploy.ps1`):**
```powershell
cd frontend
npm run build
vercel --prod
Write-Host "Deployed to: https://frontend-green-ten-90.vercel.app"
```

**Usage:**
```bash
.\deploy.ps1
```

## Notes

- The production URL (`frontend-green-ten-90.vercel.app`) is **stable** and won't change
- Preview URLs change but can be ignored
- Always use `vercel --prod` to update production
- The production URL gets updated automatically with each deployment

