# Frontend BMCP

Frontend components for **Bitcoin Multichain Protocol** - enabling cross-chain messaging from Bitcoin to EVM chains.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.3-blue.svg)](https://www.typescriptlang.org/)

## 📦 Packages

This monorepo contains two main packages:

### 1. **SDK** (`/sdk`)
Core TypeScript SDK for BMCP protocol

- **Message Encoding/Decoding**: Binary format for 100KB OP_RETURN
- **Type Definitions**: Complete TypeScript types
- **Bitcoin & EVM Encoders**: Command encoders for both chains
- **Chain Selectors**: Pre-configured network constants

[Read SDK Documentation →](./sdk/README.md)

### 2. **Dashboard** (`/dashboard`)
Web interface for creating and sending BMCP messages

- **Multi-chain Support**: Base Sepolia, Sepolia, Polygon Amoy, Citrea
- **Xverse Integration**: Bitcoin wallet PSBT signing
- **Visual Message Builder**: Function signature builder with presets
- **Real-time Preview**: Decode and verify BMCP messages
- **Modern UI**: Built with React, TypeScript, and Tailwind CSS

[Read Dashboard Documentation →](./dashboard/README.md)

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- npm or yarn
- [Xverse Wallet](https://xverse.app) (for dashboard)
- Bitcoin Testnet4 funds (for transactions)

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/frontend-bmcp
cd frontend-bmcp

# Install all dependencies
npm run install:all

# Or if using workspaces (recommended)
npm install
```

### Development

```bash
# Build the SDK (required first)
npm run build:sdk

# Start the dashboard in development mode
npm run dev
```

The dashboard will open at `http://localhost:5173`

### Building for Production

```bash
# Build everything
npm run build

# Or build individually
npm run build:sdk      # Build SDK only
npm run build:dashboard # Build dashboard only
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
├── sdk/                    # Core SDK package
│   ├── bitcoin/           # Bitcoin-specific encoders
│   ├── evm/              # EVM-specific encoders
│   ├── encoding/         # Message encoding utilities
│   ├── types/            # TypeScript definitions
│   └── dist/             # Compiled output
│
├── dashboard/             # Web dashboard
│   ├── src/
│   │   ├── App.tsx       # Main app component
│   │   ├── BMCPDashboard.tsx  # Dashboard UI
│   │   └── main.tsx      # Entry point
│   └── dist/             # Built files
│
├── package.json          # Root workspace config
└── README.md            # This file
```

## 🔧 Development Workflow

### 1. SDK Development

```bash
cd sdk

# Make changes to SDK files
# bitcoin/BitcoinCommandEncoder.ts
# evm/EVMCommandEncoder.ts
# encoding/MessageEncoder.ts

# Build
npm run build

# Test in dashboard
cd ../dashboard
npm run dev
```

### 2. Dashboard Development

```bash
cd dashboard

# Make changes to React components
# src/BMCPDashboard.tsx
# src/App.tsx

# Hot reload during development
npm run dev

# Build for production
npm run build
```

## 🧪 Testing

### SDK Testing
```bash
cd sdk
npm test
```

### Dashboard Testing
```bash
cd dashboard
npm test
```

## 📚 Documentation

- **[SDK API Reference](./sdk/README.md)**: Complete SDK documentation
- **[Dashboard Guide](./dashboard/README.md)**: User guide and features
- **[BMCP Protocol Spec](https://github.com/YOUR_USERNAME/BMCP)**: Protocol details

## 🔗 Related Repositories

- **[BMCP Core](https://github.com/YOUR_USERNAME/BMCP)**: Main protocol repository with contracts and relayers
- **[BMCP Contracts](https://github.com/YOUR_USERNAME/BMCP)**: Solidity smart contracts
- **[BMCP Relayer](https://github.com/YOUR_USERNAME/BMCP)**: CRE relayer implementation

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

