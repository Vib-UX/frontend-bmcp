# Frontend BMCP Quickstart

Get up and running with Frontend BMCP in 5 minutes!

## One-Line Setup

```bash
git clone https://github.com/YOUR_USERNAME/frontend-bmcp && cd frontend-bmcp && npm install && npm run dev
```

## Manual Setup (2 Steps)

### 1. Clone and Install

```bash
git clone https://github.com/YOUR_USERNAME/frontend-bmcp
cd frontend-bmcp
npm install
```

### 2. Start Dashboard

```bash
npm run dev
```

Open http://localhost:8080 🎉

## Prerequisites Checklist

Before starting, make sure you have:

- ✅ Node.js 18+ installed
- ✅ npm or yarn installed
- ✅ Xverse Wallet browser extension (for dashboard)
- ✅ Bitcoin testnet4 funds (for transactions)

**Note**: The Bitcoin API is pre-configured to use the production endpoint at `https://bmcpbitcoin-api-production.up.railway.app`. No local API setup is required!

## Local Bitcoin API Setup (Optional)

Only needed if you want to run your own Bitcoin API instance:

```bash
# In a separate terminal, from main BMCP repo
cd /path/to/BMCP/packages/bitcoin-api
npm install
npm run dev

# Then create .env file with:
# VITE_BITCOIN_API_URL=http://localhost:3000
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

1. The BMCP data is automatically generated as you type
2. Click "Send Bitcoin Transaction" → Complete all steps automatically:
   - Fetches PSBT
   - Signs with Xverse
   - Broadcasts to Bitcoin network

### 4. Track Transaction

- Copy transaction hash
- View on mempool.space/testnet4
- Wait for confirmation (~10 minutes)

## SDK Usage Example

The SDK is built-in at `src/lib/`:

```typescript
import { BitcoinCommandEncoder, CHAIN_SELECTORS } from './lib';

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
npm run dev              # Start dashboard with hot reload

# Building
npm run build            # Build for production

# Preview
npm run preview          # Preview production build

# Linting
npm run lint            # Check code quality
```

## Project Structure

```
frontend-bmcp/
├── src/
│   ├── lib/            # BMCP SDK (integrated)
│   ├── App.tsx         # Main app component
│   ├── BMCPDashboard.tsx  # Dashboard UI
│   └── main.tsx        # Entry point
├── dist/               # Production build output
├── package.json        # Single package.json
└── README.md          # Full documentation
```

## Troubleshooting

### "No UTXOs found"
Get testnet BTC: https://mempool.space/testnet4/faucet

### "Failed to fetch PSBT"
The production API should be working. If you need to use a local API:
1. Start local Bitcoin API: `cd /path/to/BMCP/packages/bitcoin-api && npm run dev`
2. Create `.env` file: `VITE_BITCOIN_API_URL=http://localhost:3000`
3. Restart dev server

### "Wallet not found"
Install Xverse: https://xverse.app

### Build errors
```bash
rm -rf node_modules package-lock.json
npm install
npm run build
```

## Deployment

### Vercel

```bash
vercel
```

### Netlify

```yaml
# netlify.toml
[build]
  command = "npm run build"
  publish = "dist"
```

### Other Platforms

```bash
npm run build
# Upload dist/ folder
```

## Next Steps

- 📚 Read full [README.md](./README.md)
- 🛠️ Check [SETUP.md](./SETUP.md) for detailed setup
- 🤝 See [CONTRIBUTING.md](./CONTRIBUTING.md) to contribute

## Get Help

- **Issues**: https://github.com/YOUR_USERNAME/frontend-bmcp/issues
- **Discussions**: https://github.com/YOUR_USERNAME/frontend-bmcp/discussions

---

Happy coding! 🚀
