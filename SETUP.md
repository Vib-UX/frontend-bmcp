# Frontend BMCP Setup Guide

Complete setup guide for developing and deploying Frontend BMCP.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [Development](#development)
5. [Production Build](#production-build)
6. [Deployment](#deployment)
7. [Troubleshooting](#troubleshooting)

## Prerequisites

### Required Software

1. **Node.js 18+**
   ```bash
   # Check version
   node --version  # Should be 18.0.0 or higher
   
   # Install via nvm (recommended)
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   nvm install 18
   nvm use 18
   ```

2. **npm or yarn**
   ```bash
   # npm comes with Node.js
   npm --version
   
   # Or install yarn
   npm install -g yarn
   ```

3. **Git**
   ```bash
   git --version
   ```

### For Dashboard Development

4. **Xverse Wallet**
   - Install from [xverse.app](https://xverse.app)
   - Create or import a wallet
   - Switch to Testnet mode

5. **Bitcoin Testnet Funds**
   - Get testnet4 BTC from faucets:
     - https://mempool.space/testnet4/faucet
     - https://coinfaucet.eu/en/btc-testnet4/

6. **Bitcoin API Server** (from main BMCP repo)
   ```bash
   # In separate terminal
   cd /path/to/BMCP/packages/bitcoin-api
   npm install
   npm run dev
   ```

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/frontend-bmcp
cd frontend-bmcp
```

### 2. Install Dependencies

**Option A: Using npm workspaces (recommended)**
```bash
npm install
```

This will install dependencies for both packages automatically.

**Option B: Manual installation**
```bash
# Install root dependencies
npm install

# Install SDK dependencies
cd sdk
npm install

# Install dashboard dependencies
cd ../dashboard
npm install

# Return to root
cd ..
```

### 3. Build SDK

The SDK must be built before the dashboard can use it:

```bash
npm run build:sdk
```

Verify SDK build:
```bash
ls -la sdk/dist/
# Should see: index.js, index.d.ts, bitcoin/, evm/, encoding/, types/
```

## Configuration

### Dashboard Configuration

The dashboard needs to connect to a Bitcoin API server.

1. **Check API URL** in `dashboard/src/BMCPDashboard.tsx`:
   ```typescript
   const BITCOIN_API_URL = 'http://localhost:3000';
   ```

2. **Chain Selectors** are pre-configured in the SDK:
   ```typescript
   // sdk/types/index.ts
   export const CHAIN_SELECTORS = {
     BASE_SEPOLIA: '0x8fb23cf86bad5c09',
     SEPOLIA: '0xaa36a7',
     POLYGON_AMOY: '0x383901e50dc44511',
     CITREA_TESTNET: '0x434954524541',
   };
   ```

### Environment Variables (Optional)

Create `.env` files if needed:

**dashboard/.env**
```env
VITE_BITCOIN_API_URL=http://localhost:3000
VITE_NETWORK=testnet4
```

## Development

### 1. Start Development Server

```bash
# From root directory
npm run dev
```

This will:
- Use the built SDK from `sdk/dist/`
- Start Vite dev server for dashboard
- Open browser at `http://localhost:5173`

### 2. Making SDK Changes

If you modify SDK code:

```bash
# Rebuild SDK
npm run build:sdk

# Restart dashboard dev server
# (or it may hot-reload automatically)
```

### 3. Hot Reload

- Dashboard files hot-reload automatically
- SDK changes require rebuild
- Configuration changes may require restart

### 4. Development Workflow

```bash
# Terminal 1: Bitcoin API (from main BMCP repo)
cd /path/to/BMCP/packages/bitcoin-api
npm run dev

# Terminal 2: Frontend BMCP Dashboard
cd /path/to/frontend-bmcp
npm run dev
```

## Production Build

### Build All Packages

```bash
npm run build
```

This will:
1. Build SDK → `sdk/dist/`
2. Build Dashboard → `dashboard/dist/`

### Build Individual Packages

```bash
# Build SDK only
npm run build:sdk

# Build dashboard only
npm run build:dashboard
```

### Verify Builds

```bash
# Check SDK build
ls -la sdk/dist/
# Should see compiled JavaScript and type definitions

# Check dashboard build
ls -la dashboard/dist/
# Should see index.html, assets/
```

### Test Production Build Locally

```bash
cd dashboard
npm run preview
```

Opens production build at `http://localhost:4173`

## Deployment

### Deploy Dashboard to Vercel

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Deploy**
   ```bash
   cd dashboard
   vercel
   ```

3. **Configure Project**
   - Build Command: `npm run build`
   - Output Directory: `dist`
   - Install Command: `npm install`

### Deploy to Netlify

1. **Install Netlify CLI**
   ```bash
   npm install -g netlify-cli
   ```

2. **Deploy**
   ```bash
   cd dashboard
   netlify deploy --prod
   ```

3. **Configure**
   - Build command: `npm run build`
   - Publish directory: `dist`

### Deploy to GitHub Pages

1. **Add deployment script** to `dashboard/package.json`:
   ```json
   {
     "scripts": {
       "deploy": "vite build && gh-pages -d dist"
     }
   }
   ```

2. **Install gh-pages**
   ```bash
   cd dashboard
   npm install --save-dev gh-pages
   ```

3. **Deploy**
   ```bash
   npm run deploy
   ```

### Publish SDK to npm

1. **Update version** in `sdk/package.json`
   ```json
   {
     "version": "1.0.1"
   }
   ```

2. **Build and publish**
   ```bash
   cd sdk
   npm run build
   npm publish
   ```

## Troubleshooting

### Common Issues

#### 1. "Cannot find module '@bmcp/sdk'"

**Problem**: Dashboard can't find SDK

**Solution**:
```bash
# Build SDK first
npm run build:sdk

# Verify dashboard dependency
cd dashboard
npm list @bmcp/sdk
# Should show: @bmcp/sdk@1.0.0 -> ../sdk

# Reinstall if needed
npm install
```

#### 2. "No UTXOs found"

**Problem**: Bitcoin address has no funds

**Solution**:
- Get testnet4 BTC from faucet
- Wait for transaction confirmation
- Check address on mempool.space

#### 3. "Failed to fetch PSBT"

**Problem**: Bitcoin API not running

**Solution**:
```bash
# Start Bitcoin API
cd /path/to/BMCP/packages/bitcoin-api
npm run dev

# Verify it's running
curl http://localhost:3000/health
```

#### 4. "Xverse wallet not found"

**Problem**: Wallet not installed or not in testnet mode

**Solution**:
- Install Xverse extension
- Open wallet → Settings → Network → Testnet
- Refresh dashboard page

#### 5. Build errors after SDK changes

**Problem**: Stale cache or incomplete build

**Solution**:
```bash
# Clean everything
npm run clean

# Rebuild from scratch
npm install
npm run build:sdk
npm run build:dashboard
```

#### 6. TypeScript errors in dashboard

**Problem**: Dashboard using old SDK types

**Solution**:
```bash
# Rebuild SDK
cd sdk
npm run clean
npm run build

# Restart dashboard dev server
cd ../dashboard
npm run dev
```

### Getting Help

If you encounter issues:

1. **Check existing issues**: [GitHub Issues](https://github.com/YOUR_USERNAME/frontend-bmcp/issues)
2. **Search discussions**: [GitHub Discussions](https://github.com/YOUR_USERNAME/frontend-bmcp/discussions)
3. **Create new issue**: Include error messages, steps to reproduce, environment info

### Debug Mode

Enable detailed logging:

```typescript
// dashboard/src/BMCPDashboard.tsx
const DEBUG = true;

if (DEBUG) {
  console.log('BMCP Data:', bmcpData);
  console.log('Decoded:', decoded);
}
```

### Useful Commands

```bash
# Check dependency tree
npm list --all

# Verify builds
npm run build && ls -la sdk/dist dashboard/dist

# Clean and rebuild
npm run clean && npm install && npm run build

# Check for outdated packages
npm outdated

# Update dependencies
npm update
```

## Next Steps

- Read [README.md](./README.md) for usage examples
- Check [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution guidelines
- Explore [examples](./examples/) directory
- Review SDK [documentation](./sdk/README.md)
- Try the [dashboard](./dashboard/README.md)

---

Need help? Open an issue or join our community discussions!

