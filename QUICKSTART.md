# Frontend BMCP Quickstart

Get up and running with Frontend BMCP in 5 minutes!

## One-Line Setup

```bash
git clone https://github.com/YOUR_USERNAME/frontend-bmcp && cd frontend-bmcp && ./setup.sh
```

## Manual Setup (3 Steps)

### 1. Clone and Install

```bash
git clone https://github.com/YOUR_USERNAME/frontend-bmcp
cd frontend-bmcp
npm install
```

### 2. Build SDK

```bash
npm run build:sdk
```

### 3. Start Dashboard

```bash
npm run dev
```

Open http://localhost:5173 🎉

## Prerequisites Checklist

Before starting, make sure you have:

- ✅ Node.js 18+ installed
- ✅ npm or yarn installed
- ✅ Xverse Wallet browser extension (for dashboard)
- ✅ Bitcoin testnet4 funds (for transactions)
- ✅ Bitcoin API running (from main BMCP repo)

## Bitcoin API Setup

The dashboard needs the Bitcoin API running:

```bash
# In a separate terminal, from main BMCP repo
cd /path/to/BMCP/packages/bitcoin-api
npm install
npm run dev
```

Verify: http://localhost:3000/health

## First Steps with Dashboard

### 1. Connect Xverse Wallet

1. Click "Connect Xverse" button
2. Approve wallet connection
3. Switch to Testnet in Xverse settings

### 2. Create Your First Message

1. **Select Chain**: Choose "Base Sepolia"
2. **Receiver Address**: Enter contract address (e.g., `0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb`)
3. **Function**: Select "deposit(address,uint256)" or enter custom
4. **Arguments**: `["0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb", "1000000000000000000"]`

### 3. Generate and Send

1. Click "Generate BMCP Data" → See encoded message
2. Click "Fetch PSBT" → Create unsigned transaction
3. Click "Sign PSBT" → Sign with Xverse
4. Click "Broadcast" → Send to Bitcoin network

### 4. Track Transaction

- Copy transaction hash
- View on mempool.space/testnet4
- Wait for confirmation (~10 minutes)

## SDK Usage Example

```typescript
import { BitcoinCommandEncoder, CHAIN_SELECTORS } from '@bmcp/sdk';

// Encode a message
const bmcpData = BitcoinCommandEncoder.encodeBinary(
  CHAIN_SELECTORS.BASE_SEPOLIA,
  '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb',
  {
    signature: 'transfer(address,uint256)',
    args: ['0xRecipient', '1000000000000000000']
  }
);

console.log('BMCP Data:', bmcpData.toString('hex'));
```

## Common Commands

```bash
# Development
npm run dev              # Start dashboard (after building SDK)

# Building
npm run build            # Build everything
npm run build:sdk        # Build SDK only
npm run build:dashboard  # Build dashboard only

# Cleaning
npm run clean            # Clean all build outputs

# Testing
cd sdk && npm test       # Test SDK
cd dashboard && npm test # Test dashboard
```

## Project Structure

```
frontend-bmcp/
├── sdk/              # Core SDK for encoding/decoding
├── dashboard/        # React web interface
├── README.md         # Full documentation
├── SETUP.md          # Detailed setup guide
└── setup.sh          # Automated setup script
```

## Troubleshooting

### "Cannot find module '@bmcp/sdk'"
```bash
npm run build:sdk
```

### "No UTXOs found"
Get testnet BTC: https://mempool.space/testnet4/faucet

### "Failed to fetch PSBT"
Start Bitcoin API: `cd /path/to/BMCP/packages/bitcoin-api && npm run dev`

### "Wallet not found"
Install Xverse: https://xverse.app

## Next Steps

- 📚 Read full [README.md](./README.md)
- 🛠️ Check [SETUP.md](./SETUP.md) for detailed setup
- 🤝 See [CONTRIBUTING.md](./CONTRIBUTING.md) to contribute
- 📖 Explore [SDK documentation](./sdk/README.md)
- 🎨 Try [Dashboard guide](./dashboard/README.md)

## Get Help

- **Issues**: https://github.com/YOUR_USERNAME/frontend-bmcp/issues
- **Discussions**: https://github.com/YOUR_USERNAME/frontend-bmcp/discussions

---

Happy coding! 🚀

