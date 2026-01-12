@echo off
echo.
echo ========================================
echo   Day 1 Close Roadmap - Quick Update
echo ========================================
echo.
echo Checking for CSV files...
if not exist "roadmap_data.csv" (
    echo ERROR: roadmap_data.csv not found!
    echo Please export your Excel file as CSV first.
    pause
    exit /b 1
)

echo [OK] Found roadmap_data.csv

if exist "future_milestones.csv" (
    echo [OK] Found future_milestones.csv
) else (
    echo [WARNING] future_milestones.csv not found - this is optional
)

echo.
echo [Step 1/4] Adding ALL changes to git...
echo  - roadmap_data.csv
echo  - future_milestones.csv (if changed)
echo  - Any HTML/config changes
git add .

echo.
echo [Step 2/4] Committing changes...
git commit -m "Update roadmap data - %date% %time%"

echo.
echo [Step 3/4] Pushing to main branch...
git push origin main

echo.
echo [Step 4/4] Deploying to live site (gh-pages)...
git checkout gh-pages
git merge main -m "Auto-merge from main"
git push origin gh-pages
git checkout main

echo.
echo ========================================
echo   SUCCESS! Roadmap Updated
echo ========================================
echo.
echo Your roadmap will be live in 1-2 minutes at:
echo https://rrusso33.github.io/Day-1-Close-Roadmap-/BD6_to_BD1_Roadmap.html
echo.
echo Opening roadmap in browser...
start https://rrusso33.github.io/Day-1-Close-Roadmap-/BD6_to_BD1_Roadmap.html
echo.
pause
