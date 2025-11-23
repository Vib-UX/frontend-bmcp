# GitHub Setup Guide

How to push this repository to GitHub as `frontend-bmcp`.

## Option 1: Create New Repository on GitHub (Recommended)

### 1. Create Repository on GitHub

Go to https://github.com/new and create a new repository:

- **Repository name**: `frontend-bmcp`
- **Description**: Frontend components for Bitcoin Multichain Protocol - Dashboard and SDK
- **Visibility**: Public (or Private)
- **DO NOT** initialize with README, .gitignore, or license (we already have these)

### 2. Push to GitHub

```bash
cd /Users/btc/frontend-bmcp

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/frontend-bmcp.git

# Push to GitHub
git push -u origin main
```

### 3. Verify

Visit https://github.com/YOUR_USERNAME/frontend-bmcp to see your repository!

## Option 2: Using GitHub CLI

If you have GitHub CLI installed:

```bash
cd /Users/btc/frontend-bmcp

# Create and push in one command
gh repo create frontend-bmcp --public --source=. --remote=origin --push

# Or for private repository
gh repo create frontend-bmcp --private --source=. --remote=origin --push
```

## Repository Settings (Optional)

### Add Topics

Add relevant topics to help others discover your project:
- bitcoin
- blockchain
- cross-chain
- ccip
- chainlink
- typescript
- react
- dashboard
- sdk

### Enable GitHub Pages (for Dashboard)

1. Go to Settings → Pages
2. Source: Deploy from a branch
3. Branch: `gh-pages` (after deploying)
4. Click Save

### Add Secrets (if deploying)

For automated deployments, add secrets:
1. Go to Settings → Secrets and variables → Actions
2. Add required secrets (API keys, etc.)

## Branches Strategy

### Main Branch (Protected)

```bash
# Protect main branch
# Go to Settings → Branches → Add rule
# Branch name pattern: main
# ✅ Require pull request before merging
# ✅ Require status checks to pass
```

### Development Workflow

```bash
# Create feature branch
git checkout -b feature/new-feature

# Make changes and commit
git add .
git commit -m "feat: add new feature"

# Push feature branch
git push origin feature/new-feature

# Create Pull Request on GitHub
# Merge after review
```

## Update Repository Information

### 1. Update package.json URLs

Replace `YOUR_USERNAME` in `/Users/btc/frontend-bmcp/package.json`:

```json
{
  "repository": {
    "type": "git",
    "url": "https://github.com/YOUR_ACTUAL_USERNAME/frontend-bmcp"
  }
}
```

### 2. Update README.md Links

Find and replace `YOUR_USERNAME` in all markdown files:

```bash
cd /Users/btc/frontend-bmcp

# macOS/Linux
find . -name "*.md" -type f -exec sed -i '' 's/YOUR_USERNAME/YOUR_ACTUAL_USERNAME/g' {} +

# Or manually edit:
# - README.md
# - QUICKSTART.md
# - SETUP.md
# - CONTRIBUTING.md
```

### 3. Commit Changes

```bash
git add .
git commit -m "docs: update repository URLs"
git push origin main
```

## Continuous Integration (Optional)

### GitHub Actions Workflow

Create `.github/workflows/build.yml`:

```yaml
name: Build and Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
        
    - name: Install dependencies
      run: npm install
      
    - name: Build SDK
      run: npm run build:sdk
      
    - name: Build Dashboard
      run: npm run build:dashboard
      
    - name: Test
      run: npm test
```

## Deploy Dashboard to Vercel

### 1. Connect to Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Login
vercel login

# Deploy
cd dashboard
vercel
```

### 2. Configure Vercel

In Vercel dashboard:
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm install`
- **Root Directory**: `dashboard`

### 3. Add to README

Update README.md with live demo link:

```markdown
## 🚀 Live Demo

Try the dashboard: https://frontend-bmcp.vercel.app
```

## Collaborate with Others

### Add Collaborators

1. Go to Settings → Collaborators
2. Click "Add people"
3. Enter GitHub username or email
4. Select role (Write, Maintain, Admin)

### Create Issues Template

Create `.github/ISSUE_TEMPLATE/bug_report.md`:

```markdown
---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. See error

**Expected behavior**
What you expected to happen.

**Screenshots**
If applicable, add screenshots.

**Environment:**
- OS: [e.g. macOS]
- Node version: [e.g. 18.0.0]
- Browser [e.g. chrome, safari]
```

## Maintenance Tasks

### Regular Updates

```bash
# Pull latest changes
git pull origin main

# Update dependencies
npm update
npm run build

# Check for security issues
npm audit
npm audit fix
```

### Create Releases

```bash
# Tag version
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0

# Create release on GitHub
# Go to Releases → Draft a new release
# Select tag, add release notes
```

## Useful Git Commands

```bash
# Check status
git status

# View commit history
git log --oneline

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Create and switch to branch
git checkout -b feature-branch

# Switch branches
git checkout main

# Delete branch
git branch -d feature-branch

# Force push (use carefully!)
git push --force origin main
```

## Troubleshooting

### "Repository already exists"

If the repository name is taken:
1. Choose a different name (e.g., `bmcp-frontend`)
2. Update package.json and documentation

### "Permission denied"

Setup SSH keys:
```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Add to GitHub
# Copy public key: cat ~/.ssh/id_ed25519.pub
# Go to GitHub → Settings → SSH Keys → New SSH key
```

### "Failed to push"

```bash
# Pull changes first
git pull origin main --rebase

# Then push
git push origin main
```

## Next Steps

After pushing to GitHub:

1. ✅ Update README.md with correct repository URLs
2. ✅ Add repository description and topics
3. ✅ Enable GitHub Pages (optional)
4. ✅ Set up GitHub Actions (optional)
5. ✅ Deploy dashboard to Vercel/Netlify
6. ✅ Create initial issues for planned features
7. ✅ Announce your repository!

---

Questions? Check the [GitHub Docs](https://docs.github.com) or open an issue!

