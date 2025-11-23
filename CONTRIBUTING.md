# Contributing to Frontend BMCP

Thank you for your interest in contributing to Frontend BMCP! This document provides guidelines and instructions for contributing.

## Getting Started

### Prerequisites

- Node.js 18 or higher
- npm or yarn
- Git
- A GitHub account

### Setting Up Development Environment

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/frontend-bmcp
   cd frontend-bmcp
   ```

3. **Install dependencies**
   ```bash
   npm install
   ```

4. **Build the SDK**
   ```bash
   npm run build:sdk
   ```

5. **Start development**
   ```bash
   npm run dev
   ```

## Development Workflow

### Making Changes

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Write clean, readable code
   - Follow existing code style
   - Add comments where necessary

3. **Test your changes**
   ```bash
   npm run build    # Ensure everything builds
   npm run dev      # Test in development mode
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add amazing feature"
   ```

### Commit Message Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

Examples:
```
feat: add support for new chain selector
fix: resolve encoding issue with large messages
docs: update SDK usage examples
```

### Pull Request Process

1. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your fork and branch
   - Fill out the PR template

3. **PR Requirements**
   - Clear description of changes
   - Reference any related issues
   - All builds pass
   - Code follows style guidelines
   - Documentation updated (if needed)

## Code Style Guidelines

### TypeScript

- Use TypeScript strict mode
- Define explicit types (avoid `any`)
- Use interfaces for object shapes
- Export types and interfaces

```typescript
// Good
interface MessageParams {
  chainSelector: string;
  receiver: string;
  data: Uint8Array;
}

export function encodeMessage(params: MessageParams): Buffer {
  // implementation
}

// Avoid
export function encodeMessage(params: any) {
  // implementation
}
```

### React Components

- Use functional components with hooks
- Keep components small and focused
- Extract reusable logic into hooks
- Use meaningful component names

```typescript
// Good
export function MessageBuilder() {
  const [message, setMessage] = useState<Message | null>(null);
  
  return (
    <div className="message-builder">
      {/* component content */}
    </div>
  );
}
```

### Naming Conventions

- **Files**: PascalCase for components (`MessageBuilder.tsx`), camelCase for utilities (`encodeMessage.ts`)
- **Components**: PascalCase (`MessageBuilder`)
- **Functions**: camelCase (`encodeMessage`)
- **Constants**: UPPER_SNAKE_CASE (`CHAIN_SELECTORS`)
- **Interfaces/Types**: PascalCase (`MessageParams`)

## Project Structure

### SDK Package (`/sdk`)

```
sdk/
├── bitcoin/          # Bitcoin-specific encoders
├── evm/             # EVM-specific encoders
├── encoding/        # Core encoding logic
├── types/           # TypeScript definitions
└── index.ts         # Main exports
```

### Dashboard Package (`/dashboard`)

```
dashboard/
├── src/
│   ├── App.tsx              # Main app component
│   ├── BMCPDashboard.tsx    # Dashboard UI
│   ├── main.tsx             # Entry point
│   └── index.css            # Global styles
├── index.html
└── vite.config.ts
```

## Testing Guidelines

### Writing Tests

- Write tests for new features
- Test edge cases and error handling
- Use descriptive test names
- Keep tests focused and simple

```typescript
describe('BitcoinCommandEncoder', () => {
  it('should encode a valid BMCP message', () => {
    const result = BitcoinCommandEncoder.encodeBinary(
      CHAIN_SELECTORS.BASE_SEPOLIA,
      CONTRACT_ADDRESS,
      { signature: 'transfer(address,uint256)', args: [recipient, amount] }
    );
    
    expect(result).toBeDefined();
    expect(result.length).toBeGreaterThan(0);
  });
  
  it('should throw error for invalid chain selector', () => {
    expect(() => {
      BitcoinCommandEncoder.encodeBinary('invalid', CONTRACT_ADDRESS, {});
    }).toThrow();
  });
});
```

## Documentation

### Code Documentation

- Add JSDoc comments for public APIs
- Document complex logic
- Include usage examples

```typescript
/**
 * Encodes a BMCP message for Bitcoin OP_RETURN
 * 
 * @param chainSelector - Destination chain selector (8 bytes)
 * @param receiver - EVM contract address (20 bytes)
 * @param functionCall - Function signature and arguments
 * @param options - Optional nonce and deadline
 * @returns Encoded BMCP message as Buffer
 * 
 * @example
 * ```typescript
 * const bmcp = BitcoinCommandEncoder.encodeBinary(
 *   CHAIN_SELECTORS.BASE_SEPOLIA,
 *   '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb',
 *   { signature: 'transfer(address,uint256)', args: [to, amount] }
 * );
 * ```
 */
export function encodeBinary(/* params */): Buffer {
  // implementation
}
```

### README Updates

- Update README.md for significant changes
- Add examples for new features
- Keep documentation in sync with code

## Common Tasks

### Adding a New Chain

1. Add chain selector to `sdk/types/index.ts`
   ```typescript
   export const CHAIN_SELECTORS = {
     // existing chains...
     NEW_CHAIN: '0xYOUR_SELECTOR',
   };
   ```

2. Update dashboard chain list in `dashboard/src/BMCPDashboard.tsx`
   ```typescript
   const chains = [
     // existing chains...
     { name: 'New Chain', selector: CHAIN_SELECTORS.NEW_CHAIN },
   ];
   ```

3. Update documentation
   - Add to README.md supported networks table
   - Update examples if needed

### Adding a New Feature

1. Implement in appropriate package (SDK or Dashboard)
2. Add tests
3. Update documentation
4. Add usage examples
5. Create pull request

## Getting Help

### Resources

- **Documentation**: [README.md](./README.md)
- **Issues**: [GitHub Issues](https://github.com/YOUR_USERNAME/frontend-bmcp/issues)
- **Discussions**: [GitHub Discussions](https://github.com/YOUR_USERNAME/frontend-bmcp/discussions)

### Questions

- Check existing issues and discussions
- Ask in GitHub Discussions for general questions
- Create an issue for bugs or feature requests

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes (for significant contributions)
- Credited in commit history

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to Frontend BMCP! 🚀

