#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   GitHub Profile Deployment Script    ║${NC}"
echo -e "${BLUE}║        Paula's Portfolio Setup         ║${NC}"
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo ""

# Change to correct directory
cd /mnt/c/Users/maria/Documents/OfteaHeat1997

echo -e "${GREEN}✓${NC} Changed to project directory"
echo ""

# Check if files exist
echo -e "${BLUE}Checking files...${NC}"
if [ -f "README.md" ] && [ -f "index.html" ]; then
    echo -e "${GREEN}✓${NC} All files are ready!"
else
    echo -e "${RED}✗${NC} Files are missing!"
    exit 1
fi
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo -e "${BLUE}Initializing git...${NC}"
    git init
    git add .
    git commit -m "✨ Initial commit: Add animated GitHub profile and portfolio"
    echo -e "${GREEN}✓${NC} Git initialized and files committed"
else
    echo -e "${GREEN}✓${NC} Git already initialized"
fi
echo ""

# Check if remote exists
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}⚠${NC}  Remote 'origin' already exists. Removing it..."
    git remote remove origin
fi

# Add remote
echo -e "${BLUE}Adding GitHub remote...${NC}"
git remote add origin https://github.com/OfteaHeat1997/OfteaHeat1997.git
echo -e "${GREEN}✓${NC} Remote added"
echo ""

# Rename branch to main
echo -e "${BLUE}Setting branch to main...${NC}"
git branch -M main
echo -e "${GREEN}✓${NC} Branch renamed to main"
echo ""

# Try to push
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${YELLOW}Now attempting to push to GitHub...${NC}"
echo -e "${YELLOW}You may need to enter your GitHub credentials${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

git push -u origin main

# Check if push was successful
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          SUCCESS! 🎉                   ║${NC}"
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo ""
    echo -e "${GREEN}✓${NC} Your profile is now on GitHub!"
    echo ""
    echo -e "${BLUE}Next steps:${NC}"
    echo -e "1. Visit: ${YELLOW}https://github.com/OfteaHeat1997/OfteaHeat1997${NC}"
    echo -e "2. Go to Settings → Pages"
    echo -e "3. Set Source to: ${YELLOW}main${NC} branch"
    echo -e "4. Your portfolio will be live at:"
    echo -e "   ${YELLOW}https://ofteaheat1997.github.io/OfteaHeat1997/${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}╔════════════════════════════════════════╗${NC}"
    echo -e "${RED}║     Push Failed - Need Help!          ║${NC}"
    echo -e "${RED}╔════════════════════════════════════════╗${NC}"
    echo ""
    echo -e "${YELLOW}Don't worry! This usually means:${NC}"
    echo -e "1. The repository doesn't exist yet on GitHub"
    echo -e "2. You need to login to GitHub"
    echo ""
    echo -e "${BLUE}Quick Fix:${NC}"
    echo -e "1. Go to: ${YELLOW}https://github.com/new${NC}"
    echo -e "2. Name: ${YELLOW}OfteaHeat1997${NC}"
    echo -e "3. Make it ${YELLOW}Public${NC}"
    echo -e "4. Click ${YELLOW}Create repository${NC}"
    echo -e "5. Run this script again: ${YELLOW}bash deploy.sh${NC}"
    echo ""
fi
