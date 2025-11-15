# PowerShell script to push React app to GitHub
# Make sure Git is installed before running this script
# Replace YOUR_USERNAME and REPO_NAME with your GitHub details

Write-Host "=== Pushing React App to GitHub ===" -ForegroundColor Green

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "After installation, restart your terminal and run this script again." -ForegroundColor Yellow
    exit 1
}

# Check if we're in the frontend directory
if (-not (Test-Path "package.json")) {
    Write-Host "ERROR: package.json not found!" -ForegroundColor Red
    Write-Host "Please run this script from the frontend directory." -ForegroundColor Yellow
    exit 1
}

# Prompt for GitHub repository URL
$repoUrl = Read-Host "Enter your GitHub repository URL (e.g., https://github.com/YOUR_USERNAME/react-tailwind-hello-world.git)"
if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    Write-Host "ERROR: Repository URL is required!" -ForegroundColor Red
    exit 1
}

# Initialize Git repository (if not already initialized)
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Cyan
    git init
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Green
}

# Add all files
Write-Host "Adding files to Git..." -ForegroundColor Cyan
git add .

# Check if there are changes to commit
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "No changes to commit." -ForegroundColor Yellow
} else {
    # Create initial commit
    Write-Host "Creating commit..." -ForegroundColor Cyan
    git commit -m "Initial commit: React + Tailwind CSS Hello World app"
}

# Check if remote exists
$remoteExists = git remote | Select-String -Pattern "origin" -Quiet
if (-not $remoteExists) {
    Write-Host "Adding remote repository..." -ForegroundColor Cyan
    git remote add origin $repoUrl
} else {
    Write-Host "Remote 'origin' already exists. Updating..." -ForegroundColor Yellow
    git remote set-url origin $repoUrl
}

# Rename branch to main (if needed)
Write-Host "Setting branch to main..." -ForegroundColor Cyan
git branch -M main

# Push to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
Write-Host "You may be prompted for your GitHub credentials." -ForegroundColor Yellow
Write-Host "Use a Personal Access Token instead of your password." -ForegroundColor Yellow
Write-Host "Get your token from: https://github.com/settings/tokens" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== Success! Your app has been pushed to GitHub ===" -ForegroundColor Green
    Write-Host "Repository URL: $repoUrl" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "=== Error occurred while pushing ===" -ForegroundColor Red
    Write-Host "Please check your credentials and try again." -ForegroundColor Yellow
}


