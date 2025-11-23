#!/bin/bash

# Frontend BMCP Setup Script
# This script automates the initial setup process

set -e  # Exit on error

echo "🚀 Frontend BMCP Setup"
echo "======================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check Node.js version
echo "📋 Checking prerequisites..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed${NC}"
    echo "Please install Node.js 18+ from https://nodejs.org"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo -e "${RED}❌ Node.js version must be 18 or higher (current: v$NODE_VERSION)${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Node.js $(node -v)${NC}"

# Check npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed${NC}"
    exit 1
fi

echo -e "${GREEN}✅ npm $(npm -v)${NC}"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install
echo -e "${GREEN}✅ Dependencies installed${NC}"
echo ""

# Build project
echo "🔨 Building project..."
npm run build
echo -e "${GREEN}✅ Build successful${NC}"
echo ""

echo ""
echo "✨ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Start the Bitcoin API (from main BMCP repo):"
echo "     ${YELLOW}cd /path/to/BMCP/packages/bitcoin-api && npm run dev${NC}"
echo ""
echo "  2. Start the dashboard:"
echo "     ${YELLOW}npm run dev${NC}"
echo ""
echo "  3. Open your browser at ${YELLOW}http://localhost:8080${NC}"
echo ""
echo "For more information, see:"
echo "  - README.md for usage guide"
echo "  - SETUP.md for detailed setup instructions"
echo "  - CONTRIBUTING.md for contribution guidelines"
echo ""
