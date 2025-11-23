# Frontend BMCP

Frontend components for **Bitcoin Multichain Protocol** - enabling cross-chain messaging from Bitcoin to EVM chains.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.3-blue.svg)](https://www.typescriptlang.org/)

## 📦 What's Included

This is a unified project containing:

### **BMCP Dashboard**
Web interface for creating and sending BMCP messages with integrated SDK

- **Multi-chain Support**: Base Sepolia, Sepolia, Polygon Amoy, Citrea
- **Xverse Integration**: Bitcoin wallet PSBT signing
- **Visual Message Builder**: Function signature builder with presets
- **Real-time Preview**: Decode and verify BMCP messages
- **Modern UI**: Built with React, TypeScript, and Tailwind CSS
- **Integrated SDK**: Message encoding/decoding built-in

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- npm or yarn
- [Xverse Wallet](https://xverse.app) (for Bitcoin transactions)
- Bitcoin Testnet4 funds (for transactions)

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/frontend-bmcp
cd frontend-bmcp

# Install dependencies
npm install
```

### Development

```bash
# Start the development server
npm run dev
```

The dashboard will open at `http://localhost:8080`

**Note**: The dashboard is pre-configured to use the production Bitcoin API at `https://bmcpbitcoin-api-production.up.railway.app`. No local API setup is required unless you want to run your own instance.

### Custom API Configuration (Optional)

To use a different Bitcoin API endpoint (e.g., local development):

1. Copy `env.example` to `.env`:
   ```bash
   cp env.example .env
   ```

2. Edit `.env` and set your custom URL:
   ```
   VITE_BITCOIN_API_URL=http://localhost:3000
   ```

3. Restart the dev server

### Building for Production

```bash
# Build for production
npm run build

# Preview the production build
npm run preview
```

## 📖 What is BMCP?

**BMCP (Bitcoin Multichain Protocol)** enables cross-chain messaging from Bitcoin to EVM chains using:

- ✅ **100KB OP_RETURN**: Store complete messages on Bitcoin (Bitcoin Core v30.0+)
- ✅ **Chainlink CCIP**: Standard cross-chain messaging protocol
- ✅ **Single Bitcoin TX**: One transaction triggers cross-chain operations
- ✅ **Trustless**: Bitcoin provides immutable message ordering

### Architecture

```
User → Bitcoin TX → CRE Relayer → CCIP Network → EVM Chain
         (BMCP)      (Decoder)      (Router)     (Receiver)
```

## 🎯 Use Cases

### DeFi Operations
```typescript
// Uniswap swap on Base from Bitcoin
BitcoinCommandEncoder.encodeBinary(
  CHAIN_SELECTORS.BASE_SEPOLIA,
  UNISWAP_ROUTER,
  {
    signature: 'exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))',
    args: [swapParams]
  }
);
```

### Token Operations
```typescript
// ERC20 transfer on Sepolia
BitcoinCommandEncoder.encodeBinary(
  CHAIN_SELECTORS.SEPOLIA,
  TOKEN_ADDRESS,
  {
    signature: 'transfer(address,uint256)',
    args: [recipient, amount]
  }
);
```

### Custom Contracts
```typescript
// Any custom function call
BitcoinCommandEncoder.encodeBinary(
  chainSelector,
  contractAddress,
  {
    signature: 'yourFunction(uint256,string)',
    args: [value, message]
  }
);
```

## 📁 Project Structure

```
frontend-bmcp/
├── src/
│   ├── lib/                  # BMCP SDK
│   │   ├── bitcoin/         # Bitcoin-specific encoders
│   │   ├── evm/            # EVM-specific encoders
│   │   ├── encoding/       # Message encoding utilities
│   │   └── types/          # TypeScript definitions
│   ├── App.tsx             # Main app component
│   ├── BMCPDashboard.tsx   # Dashboard UI
│   ├── main.tsx            # Entry point
│   └── index.css           # Global styles
├── dist/                   # Built files
├── index.html              # HTML template
├── package.json            # Dependencies and scripts
├── tsconfig.json           # TypeScript configuration
├── vite.config.ts          # Vite configuration
├── tailwind.config.js      # Tailwind CSS configuration
└── README.md              # This file
```

## 🔧 Development Workflow

### Making Changes

```bash
# Make changes to any file in src/
# The dev server will automatically reload

# SDK files are in src/lib/
# src/lib/bitcoin/BitcoinCommandEncoder.ts
# src/lib/evm/EVMCommandEncoder.ts
# src/lib/encoding/MessageEncoder.ts

# Dashboard files are in src/
# src/BMCPDashboard.tsx
# src/App.tsx
```

### Using the SDK

The SDK is integrated directly into the project at `src/lib/`:

```typescript
import { BitcoinCommandEncoder, CHAIN_SELECTORS } from './lib';

// Encode a message
const payload = BitcoinCommandEncoder.encodeBinary(
  CHAIN_SELECTORS.SEPOLIA,
  receiverAddress,
  {
    signature: 'transfer(address,uint256)',
    args: [recipient, amount]
  }
);
```

## 🌐 Supported Networks

### Testnets
| Network         | Chain Selector      | Status |
|----------------|---------------------|--------|
| Base Sepolia   | 0x8fb23cf86bad5c09 | ✅      |
| Sepolia        | 0xaa36a7             | ✅      |
| Polygon Amoy   | 0x383901e50dc44511 | ✅      |
| Citrea Testnet | 0x434954524541      | ✅      |

### Mainnets (Coming Soon)
| Network    | Status |
|-----------|--------|
| Base      | 🚧     |
| Ethereum  | 🚧     |
| Polygon   | 🚧     |

## 🚀 Deployment

### Vercel (Recommended)

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel
```

### Netlify

```bash
# Build command: npm run build
# Publish directory: dist
```

### Manual Deployment

```bash
# Build the project
npm run build

# Upload the dist/ folder to your hosting provider
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Write TypeScript with strict type checking
- Follow existing code style
- Add tests for new features
- Update documentation
- Ensure all builds pass

## 📄 License

MIT License - see [LICENSE](./LICENSE) file for details

## 🔗 Links

- **Documentation**: [Coming Soon]
- **Website**: [Coming Soon]
- **Twitter**: [@YourHandle]
- **Discord**: [Join Community]

## 🙏 Acknowledgments

- **Chainlink CCIP**: Cross-chain messaging infrastructure
- **Bitcoin Core**: 100KB OP_RETURN capability
- **Xverse**: Bitcoin wallet integration
- **React & Vite**: Frontend framework and tooling

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/YOUR_USERNAME/frontend-bmcp/issues)
- **Discussions**: [GitHub Discussions](https://github.com/YOUR_USERNAME/frontend-bmcp/discussions)
- **Email**: support@example.com

---

Built with ❤️ for the Bitcoin and EVM communities
