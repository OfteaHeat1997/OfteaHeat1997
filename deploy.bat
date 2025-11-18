@echo off
echo ╔════════════════════════════════════════╗
echo ║   GitHub Profile Deployment Script    ║
echo ║        Paula's Portfolio Setup         ║
echo ╔════════════════════════════════════════╗
echo.

cd /d "%~dp0"
echo ✓ Changed to project directory
echo.

echo Checking files...
if not exist "README.md" (
    echo ✗ README.md is missing!
    pause
    exit /b 1
)
if not exist "index.html" (
    echo ✗ index.html is missing!
    pause
    exit /b 1
)
echo ✓ All files are ready!
echo.

echo Checking git...
if not exist ".git" (
    echo Initializing git...
    git init
    git add .
    git commit -m "✨ Initial commit: Add animated GitHub profile and portfolio"
    echo ✓ Git initialized
) else (
    echo ✓ Git already initialized
)
echo.

echo Setting up remote...
git remote remove origin 2>nul
git remote add origin https://github.com/OfteaHeat1997/OfteaHeat1997.git
git branch -M main
echo ✓ Remote configured
echo.

echo ═══════════════════════════════════════
echo Now pushing to GitHub...
echo You may need to login to GitHub
echo ═══════════════════════════════════════
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ╔════════════════════════════════════════╗
    echo ║          SUCCESS! 🎉                   ║
    echo ╔════════════════════════════════════════╗
    echo.
    echo ✓ Your profile is now on GitHub!
    echo.
    echo Next steps:
    echo 1. Visit: https://github.com/OfteaHeat1997/OfteaHeat1997
    echo 2. Go to Settings -^> Pages
    echo 3. Set Source to: main branch
    echo 4. Your portfolio will be live at:
    echo    https://ofteaheat1997.github.io/OfteaHeat1997/
    echo.
) else (
    echo.
    echo ╔════════════════════════════════════════╗
    echo ║     Need to Create Repository          ║
    echo ╔════════════════════════════════════════╗
    echo.
    echo Please:
    echo 1. Go to: https://github.com/new
    echo 2. Name: OfteaHeat1997
    echo 3. Make it Public
    echo 4. Click Create repository
    echo 5. Run this script again
    echo.
)

pause
