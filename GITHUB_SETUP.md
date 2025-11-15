# Push to GitHub - Setup Guide

This guide will help you push your React + Tailwind CSS Hello World app to GitHub.

## Step 1: Install Git

Git is not currently installed on your system. You need to install it first.

### Option A: Download Git for Windows (Recommended)

1. Go to [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Download the latest version of Git for Windows
3. Run the installer:
   - Keep all default settings
   - Choose "Git from the command line and also from 3rd-party software"
   - Choose "Use bundled OpenSSH"
   - Keep default line ending conversions (Checkout Windows-style, commit Unix-style)
   - Use Windows' default console window
   - Enable file system caching
4. After installation, **restart your terminal/PowerShell**

### Option B: Install via winget (if available)

```powershell
winget install --id Git.Git -e --source winget
```

After installation, restart your terminal.

### Verify Installation

After restarting your terminal, verify Git is installed:

```bash
git --version
```

You should see something like: `git version 2.x.x`

## Step 2: Configure Git (First Time Only)

Set your name and email (replace with your GitHub credentials):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 3: Create GitHub Repository

1. Go to [https://github.com](https://github.com) and sign in (or create an account)
2. Click the **+** icon in the top right corner
3. Select **New repository**
4. Repository name: `react-tailwind-hello-world` (or any name you prefer)
5. Description: `Hello World application with React and Tailwind CSS`
6. Choose **Public** or **Private**
7. **DO NOT** initialize with README, .gitignore, or license (we already have these)
8. Click **Create repository**

## Step 4: Initialize Git and Push to GitHub

Navigate to your frontend directory and run these commands:

```bash
cd frontend

# Initialize Git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: React + Tailwind CSS Hello World app"

# Add GitHub repository as remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/react-tailwind-hello-world.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

## Step 5: Authentication

When you push for the first time, you'll be prompted for authentication:

### Option A: GitHub Personal Access Token (Recommended)

1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click **Generate new token (classic)**
3. Give it a name: `React App Deployment`
4. Select scopes: **repo** (full control of private repositories)
5. Click **Generate token**
6. **Copy the token** (you won't see it again!)
7. When prompted for password, paste the token instead

### Option B: GitHub CLI (Alternative)

Install GitHub CLI:
```bash
winget install --id GitHub.cli
```

Then authenticate:
```bash
gh auth login
```

## Troubleshooting

### If you get "remote origin already exists"

Remove the existing remote and add it again:
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/react-tailwind-hello-world.git
```

### If you get authentication errors

- Make sure you're using a Personal Access Token, not your GitHub password
- Check that the token has the `repo` scope enabled
- Try using GitHub CLI: `gh auth login`

### If you need to update your repository

After making changes:
```bash
git add .
git commit -m "Your commit message"
git push
```

## Quick Reference Commands

```bash
# Check status
git status

# Add files
git add .

# Commit changes
git commit -m "Your message"

# Push to GitHub
git push

# Pull from GitHub
git pull
```

## Next Steps

After pushing to GitHub, you can:

1. **Deploy to Vercel**: Connect your GitHub repository in Vercel dashboard
2. **Deploy to Netlify**: Connect your GitHub repository in Netlify dashboard
3. **Set up CI/CD**: Enable automatic deployments on every push

See [DEPLOYMENT.md](./DEPLOYMENT.md) for deployment options.


