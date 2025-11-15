# Deploy to Vercel Production
# This script builds and deploys to the stable production URL

Write-Host "=== Deploying to Vercel Production ===" -ForegroundColor Green
Write-Host ""

# Build the project
Write-Host "Building project..." -ForegroundColor Cyan
npm.cmd run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed! Aborting deployment." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Build successful!" -ForegroundColor Green
Write-Host ""

# Deploy to production
Write-Host "Deploying to production..." -ForegroundColor Cyan
vercel --prod

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== Deployment Successful! ===" -ForegroundColor Green
    Write-Host "Production URL: https://frontend-green-ten-90.vercel.app" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Your app is now live at the stable production URL." -ForegroundColor Yellow
    Write-Host "This URL will not change with future deployments." -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "=== Deployment Failed ===" -ForegroundColor Red
    Write-Host "Please check the error messages above." -ForegroundColor Yellow
}

