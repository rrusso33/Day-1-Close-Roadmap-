# Day 1 Close Roadmap - Quick Update Script
# PowerShell Version

Write-Host ""
Write-Host "========================================"
Write-Host "  Day 1 Close Roadmap - Quick Update"
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Change to script directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

# Check if CSV exists
if (-not (Test-Path "roadmap_data.csv")) {
    Write-Host "ERROR: roadmap_data.csv not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:"
    Write-Host "1. Export your Excel/Google Sheet as CSV"
    Write-Host "2. Save it as 'roadmap_data.csv' in this folder:"
    Write-Host "   $scriptPath"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✓ Found roadmap_data.csv" -ForegroundColor Green
Write-Host ""

# Git operations
Write-Host "Updating GitHub repository..." -ForegroundColor Yellow

try {
    git add roadmap_data.csv
    git commit -m "Update roadmap data - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    git push origin main
    
    Write-Host "✓ Updated main branch" -ForegroundColor Green
    
    # Deploy to gh-pages
    Write-Host ""
    Write-Host "Deploying to live site..." -ForegroundColor Yellow
    
    git checkout gh-pages
    git merge main
    git push origin gh-pages
    git checkout main
    
    Write-Host "✓ Deployed to gh-pages" -ForegroundColor Green
    
    # Success message
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  SUCCESS! Roadmap Updated" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your roadmap will be live in 2-3 minutes at:"
    Write-Host "https://rrusso33.github.io/Day-1-Close-Roadmap-/BD5_to_BD1_Roadmap.html" -ForegroundColor Cyan
    Write-Host ""
    
    # Open in browser
    $openBrowser = Read-Host "Open roadmap in browser? (Y/N)"
    if ($openBrowser -eq "Y" -or $openBrowser -eq "y") {
        Start-Process "https://rrusso33.github.io/Day-1-Close-Roadmap-/BD5_to_BD1_Roadmap.html"
    }
    
} catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}

Write-Host ""
Read-Host "Press Enter to exit"

