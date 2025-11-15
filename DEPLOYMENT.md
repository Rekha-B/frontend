# Deployment Guide

This guide covers multiple ways to deploy your React + Tailwind CSS Hello World app to the cloud.

## Option 1: Vercel (Recommended - Easiest)

Vercel is the easiest way to deploy Vite/React apps with zero configuration.

### Method A: Using Vercel CLI (Fastest)

1. **Install Vercel CLI globally:**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel:**
   ```bash
   vercel login
   ```

3. **Deploy from your project directory:**
   ```bash
   vercel
   ```
   
   Follow the prompts:
   - Set up and deploy? **Yes**
   - Which scope? (Select your account)
   - Link to existing project? **No**
   - Project name? (Press Enter for default)
   - Directory? (Press Enter for `./`)
   - Override settings? **No**

4. **For production deployment:**
   ```bash
   vercel --prod
   ```

Your app will be live at a URL like: `https://your-app-name.vercel.app`

### Method B: Using Vercel Web Interface

1. Go to [vercel.com](https://vercel.com) and sign up/login
2. Click "Add New Project"
3. Import your Git repository (if you have one) OR
4. Use Vercel CLI: `vercel` (it will guide you through the process)

## Option 2: Netlify

### Using Netlify CLI

1. **Install Netlify CLI:**
   ```bash
   npm install -g netlify-cli
   ```

2. **Login to Netlify:**
   ```bash
   netlify login
   ```

3. **Build your app:**
   ```bash
   npm run build
   ```

4. **Deploy:**
   ```bash
   netlify deploy --prod --dir=dist
   ```

### Using Netlify Web Interface

1. Go to [netlify.com](https://netlify.com) and sign up
2. Drag and drop your `dist` folder (after running `npm run build`) to Netlify
3. Or connect your Git repository for continuous deployment

## Option 3: Cloudflare Pages

1. Go to [pages.cloudflare.com](https://pages.cloudflare.com)
2. Sign up/login
3. Connect your Git repository or upload the `dist` folder
4. Build settings:
   - Build command: `npm run build`
   - Build output directory: `dist`

## Option 4: GitHub Pages (Requires Git)

If you install Git and push to GitHub:

1. **Install gh-pages package:**
   ```bash
   npm install --save-dev gh-pages
   ```

2. **Add to package.json scripts:**
   ```json
   "deploy": "npm run build && gh-pages -d dist"
   ```

3. **Deploy:**
   ```bash
   npm run deploy
   ```

## Pre-Deployment Checklist

Before deploying, make sure to:

1. ✅ Test the build locally:
   ```bash
   npm run build
   npm run preview
   ```

2. ✅ Check that all files are committed (if using Git)

3. ✅ Verify environment variables (if any)

## Build Output

After running `npm run build`, your production-ready files will be in the `dist` folder. This is what gets deployed to the cloud.

## Continuous Deployment

For automatic deployments on every push:
- **Vercel**: Connect your Git repository in Vercel dashboard
- **Netlify**: Connect your Git repository in Netlify dashboard
- **Cloudflare Pages**: Connect your Git repository in Cloudflare dashboard

## Troubleshooting

### Build Fails
- Check that all dependencies are in `package.json`
- Ensure Node.js version is compatible (check `.nvmrc` if you add one)

### Assets Not Loading
- Verify `base` path in `vite.config.js` if deploying to a subdirectory
- Check that all asset paths are relative

### Tailwind Styles Not Working
- Ensure `tailwind.config.js` includes all content paths
- Verify PostCSS is configured correctly

