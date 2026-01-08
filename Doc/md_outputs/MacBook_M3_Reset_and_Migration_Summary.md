# MacBook M2 to M3 Migration Guide

## Overview
This guide helps you migrate from your MacBook Air M2 (500GB) to M3 (256GB) while managing the storage constraints.

**Current M2 Usage:** 233 GB (after cleanup)  
**M3 Available:** 256 GB  
**Strategy:** Selective migration + fresh dev tool installation

---

## Part 1: Pre-Migration Checklist ✅

### Already Completed on M2:
- ✅ Deleted duplicate/unnecessary apps (~30GB saved)
- ✅ Current usage: 233 GB

### What Will NOT Transfer (Automatic Savings):
- System Data: ~50 GB (rebuilt fresh on M3)
- macOS: ~31 GB (M3 has its own OS)

**Actual transfer size: ~175-180 GB** ✅ Fits comfortably!

---

## Part 2: Migration Assistant Strategy

### ✅ TRANSFER These:

**Applications (64.7 GB)** - Selectively transfer:
- ✅ Microsoft Office suite (Excel, Word, PowerPoint, Outlook, OneNote, Teams)
- ✅ Google apps (Chrome, Drive, Docs, Sheets, Slides)
- ✅ Final Cut Pro (keep main version only)
- ✅ Apple apps (Pages, Numbers, Keynote)
- ✅ Communication (WhatsApp, Zoom)
- ✅ Visual Studio Code
- ✅ Utilities (Rectangle Pro, FileZilla, VLC, etc.)
- ✅ OneDrive, Firefox, Microsoft Edge

**Computer & Network Settings** ✅
- Wi-Fi passwords
- System preferences (trackpad, keyboard, display)
- Bluetooth pairings
- VPN configurations
- App preferences

**Developer (2.75 GB)** ✅
- Will transfer, but you'll reinstall fresh (see Part 3)

**Mail (2.29 GB)** - Optional ✅
- Transfer if you want email history

### ❌ SKIP These:

**Documents (62.91 GB)** ❌
- Contains large video files (VHS project 11GB, test videos 10GB+)
- Manually copy only essential files later
- Most files are in OneDrive/Google Drive/iCloud anyway

**Messages (22.61 GB)** ❌
- Will re-sync from iCloud automatically

**Photos (7.49 GB)** ❌
- Will re-sync from iCloud automatically

---

## Part 3: Development Environment Setup

### 🚨 CRITICAL SECURITY WARNING
Your `.zshrc` contains a GitHub token in plain text. **Delete this immediately:**
1. Revoke token at: https://github.com/settings/tokens
2. Remove `GH_TOKEN=` line from .zshrc
3. Use `gh auth login` instead (stores tokens securely)

### Before Migration - Backup Custom Scripts
On your M2, backup your custom scripts folder:
```bash
cp -r ~/repos/scripts ~/Desktop/scripts-backup
```
Copy this to external drive or cloud storage.

### M3 Setup Script

Save this as `setup-m3.sh` on your new M3:

```bash
#!/bin/bash

echo "=== M3 Development Environment Setup ==="
echo "Starting installation..."

# 1. Install Homebrew (if not already installed)
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH (M3 is Apple Silicon)
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed"
fi

# 2. Install Homebrew packages
echo "Installing Homebrew packages..."
brew install aichat
brew install azure-cli
brew install gh
brew install git
brew install gnupg
brew install node
brew install pandoc
brew install python@3.13
brew install telnet
brew install tesseract

# 3. Install NPM global packages
echo "Installing NPM global packages..."
npm install -g @continuedev/cli
npm install -g @github/copilot
npm install -g @githubnext/github-copilot-cli
npm install -g @google/gemini-cli
npm install -g azure-functions-core-tools

# 4. Install Python packages
echo "Installing Python packages..."
pip3 install beautifulsoup4
pip3 install selenium
pip3 install playwright
pip3 install requests
pip3 install pandas
pip3 install numpy
pip3 install openpyxl
pip3 install ollama
pip3 install PyMuPDF
pip3 install pytesseract
pip3 install yt-dlp
pip3 install html2text
pip3 install pillow

# Install Playwright browsers
echo "Installing Playwright browsers..."
playwright install

# 5. Configure Git
echo "Configuring Git..."
git config --global user.name "Dennis H Mathes"
git config --global user.email "dennyrgood@yahoo.com"
git config --global pull.rebase true
git config --global core.excludesfile ~/.gitignore_global

# 6. Authenticate GitHub CLI (interactive)
echo "Authenticating GitHub CLI..."
echo "You'll need to authenticate - DO NOT use token in .zshrc!"
gh auth login

# 7. Setup custom PATH and environment variables
echo "Setting up .zshrc..."
cat >> ~/.zshrc << 'EOF'

# Custom scripts path
export PATH="$HOME/repos/scripts:$PATH"

# Ollama custom host
export OLLAMA_HOST="https://ollama.ldmathes.cc"

# AI Chat timeout
export AICHAT_TIMEOUT=120

# Checkpoint function
checkpoint() {
  sync-this "Checkpoint: $1" 
}
EOF

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "⚠️  MANUAL STEPS REQUIRED:"
echo "1. Copy ~/repos/scripts folder from M2 to M3"
echo "2. Create ~/.gitignore_global if you had one"
echo "3. Authenticate GitHub Copilot: Run 'github-copilot-cli auth'"
echo "4. Test: source ~/.zshrc"
echo ""
echo "✅ Your M3 development environment is ready!"
```

---

## Part 4: Step-by-Step Migration Process

### Phase 1: Run Migration Assistant

1. **On M3 MacBook:**
   - Open **Migration Assistant** (Applications > Utilities)
   - Select "From a Mac, Time Machine backup, or startup disk"
   - Click Continue

2. **On M2 MacBook:**
   - Open **Migration Assistant** (Applications > Utilities)
   - Select "To another Mac"
   - Click Continue

3. **Connect & Transfer:**
   - Enter security code from M2 into M3
   - **Select what to transfer:**
     - ✅ Applications (uncheck apps you don't need)
     - ✅ Computer & Network Settings
     - ✅ Developer (optional)
     - ✅ Mail (optional)
     - ❌ Documents (skip - handle manually)
     - ❌ Messages (skip - will sync from iCloud)
     - ❌ Photos (skip - will sync from iCloud)
   - Click Continue and wait (may take 1-2 hours)

### Phase 2: First Boot on M3

**Things that need re-authentication:**
- [ ] Touch ID - Set up fresh
- [ ] iCloud - Sign in with Apple ID
- [ ] OneDrive - Sign in
- [ ] Google Drive - Sign in
- [ ] Adobe apps - Sign in and authorize
- [ ] Microsoft Office - May need to reactivate
- [ ] App permissions (Camera, Microphone, Files, etc.)

### Phase 3: Development Environment Setup

1. **Copy custom scripts:**
   ```bash
   mkdir -p ~/repos
   cp -r /path/to/scripts-backup ~/repos/scripts
   ```

2. **Run setup script:**
   ```bash
   chmod +x setup-m3.sh
   ./setup-m3.sh
   ```

3. **After script completes:**
   ```bash
   # Authenticate GitHub Copilot
   github-copilot-cli auth
   
   # Reload shell configuration
   source ~/.zshrc
   ```

4. **Verify installation:**
   ```bash
   gh --version
   git --version
   node --version
   python3 --version
   pip3 list | grep pandas
   npm list -g --depth=0
   echo $OLLAMA_HOST
   ls ~/repos/scripts
   ```

### Phase 4: Manual File Transfer (If Needed)

For specific documents/files from M2:
1. Enable File Sharing on M2 (System Settings > General > Sharing)
2. Access from M3 via Finder > Network
3. Copy only essential files you need

---

## What Gets Installed - Summary

### Homebrew Packages:
- aichat, azure-cli, gh (GitHub CLI), git, gnupg, node, pandoc, python@3.13, telnet, tesseract

### NPM Global Packages:
- Continue.dev CLI
- GitHub Copilot
- GitHub Copilot CLI
- Google Gemini CLI
- Azure Functions Core Tools

### Python Packages:
- **Web scraping:** beautifulsoup4, selenium, playwright, requests
- **Data analysis:** pandas, numpy, openpyxl
- **AI/ML:** ollama
- **Documents:** PyMuPDF, html2text, pillow
- **OCR:** pytesseract
- **Video:** yt-dlp

### Git Configuration:
- User: Dennis H Mathes
- Email: dennyrgood@yahoo.com
- Pull strategy: rebase

---

## Time Estimates

| Task | Time |
|------|------|
| Migration Assistant | 1-2 hours |
| Cloud services re-sync | 30-60 min (background) |
| Dev environment setup | 20-25 min |
| Manual configuration | 15-30 min |
| **Total** | **2-4 hours** |

---

## Final Verification Checklist

### Applications:
- [ ] Microsoft Office opens and works
- [ ] Final Cut Pro launches
- [ ] Visual Studio Code opens
- [ ] Chrome/Firefox work
- [ ] OneDrive syncing

### System Settings:
- [ ] Wi-Fi connects automatically
- [ ] Trackpad gestures work as expected
- [ ] Keyboard shortcuts work
- [ ] Touch ID set up

### Development Tools:
- [ ] Git works: `git --version`
- [ ] Node works: `node --version`
- [ ] Python works: `python3 --version`
- [ ] GitHub CLI authenticated: `gh auth status`
- [ ] Copilot CLI authenticated
- [ ] Custom scripts accessible
- [ ] Environment variables set: `echo $OLLAMA_HOST`

### Cloud Services:
- [ ] iCloud syncing (Photos, Messages)
- [ ] OneDrive syncing
- [ ] Google Drive syncing

---

## Storage Management on M3

**Expected final usage:** ~120-140 GB  
**Free space:** ~110-130 GB

### Keep M3 Clean:
- Use "Optimize Storage" for iCloud (System Settings > iCloud)
- Regularly empty Trash
- Clear browser caches periodically
- Use cloud storage for large files
- Avoid local video editing projects (use external drive)

---

## Troubleshooting

### If apps don't launch:
- Check System Settings > Privacy & Security
- Allow apps to run if blocked
- Some apps may need fresh install

### If development tools fail:
- Ensure Homebrew installed correctly: `brew doctor`
- Check PATH: `echo $PATH`
- Reload shell: `source ~/.zshrc`

### If storage fills up:
- System Settings > General > Storage
- Click "Review Large Files"
- Check Downloads folder
- Clear browser caches

---

## Support Resources

- **Anthropic/Claude support:** https://support.claude.com
- **Migration Assistant:** https://support.apple.com/en-us/HT204350
- **Homebrew:** https://brew.sh
- **GitHub CLI:** https://cli.github.com

---

**Document Version:** 1.0  
**Date:** January 2026  
**Migration:** MacBook Air M2 → MacBook Air M3