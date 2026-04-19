# Quick Setup Linux Distribution

Automated setup scripts to quickly configure Ubuntu and Fedora systems with essential packages, development tools, themes, and customizations.

## 📋 Overview

This project provides shell scripts that automate the initial setup of Linux systems. Instead of manually installing and configuring each tool, simply run the appropriate script for your distribution.

**Supported Distributions:**

- Ubuntu (20.04+)
- Fedora

## ⚡ Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/dhoaibao/quick-setup-linux-distribution.git
cd quick-setup-linux-distribution/
```

### 2. Make Scripts Executable

```bash
sudo chmod +x ./*.sh
```

### 3. Run the Setup Script

**For Ubuntu:**

```bash
sudo bash Ubuntu.sh
```

**For Fedora:**

```bash
sudo bash Fedora.sh
```

## 📦 What Gets Installed

### System & Development Tools

- **Git** (latest version via PPA)
- **Docker** & Docker Compose
- **Node.js** (via npm)
- **Bun** (Zig-based JavaScript runtime)
- **NVM** (Node Version Manager)
- **Neovim** (modern text editor)
- **zsh** (shell)
- **curl** & **wget** (download utilities)
- **gh** (GitHub CLI)

### Package Managers

- **nala** (modern apt frontend for Ubuntu)
- **dnf** (native on Fedora)

### Desktop Customization

- **Oh My Zsh** (shell framework)
- **Powerlevel10k** (Zsh theme)
- **Dracula Theme** (GNOME Terminal)
- **McMojave & Bibata Cursors**
- **Additional Fonts** (included in `/fonts` directory)

### Productivity Tools

- **LibreOffice** (office suite)
- **FileZilla** (FTP client)
- **neofetch/fastfetch** (system info display)

### Ubuntu-Specific

- **ibus-bamboo** (Vietnamese input method)
- **GNOME Tweaks** (system customization)
- **GNOME Shell Extension Manager**

### IDE & Editors

- **LazyVim** (Neovim configuration)

## 📂 Project Structure

```
quick-setup-linux-distribution/
├── Ubuntu.sh              # Ubuntu setup script
├── Fedora.sh              # Fedora setup script
├── README.md              # This file
├── fonts/                 # Font files to install
├── cursors/               # Cursor theme files
├── wallpapers/            # Wallpaper images
└── .gitignore             # Git ignore file
```

## ⚙️ Key Features

### Ubuntu Script

- Updates system with latest packages
- Adds PPA for latest Git version
- Uses Nala for improved package management
- Sets up Docker with official repository
- Installs ibus-bamboo for Vietnamese input
- Configures system clock to local time

### Fedora Script

- Upgrades system using dnf
- Installs Docker from official repository
- Enables Docker service automatically
- Comparable feature set to Ubuntu variant

### Both Scripts

- Installs shell customizations (Oh My Zsh + powerlevel10k)
- Moves fonts and cursors to system directories
- Configures Dracula theme for terminal
- Sets up Node.js environment (NVM)
- Installs LazyVim configuration
- Error handling with `set -e`

## 🚀 Usage Notes

- **Run with sudo**: Scripts require superuser privileges for system-level installations
- **One-time run**: These scripts are designed to run once per system setup
- **Customizable**: Edit the scripts before running to include/exclude tools you don't need
- **Interactive setup**: Some tools (Oh My Zsh, LazyVim) may require interactive input

## 🔧 Customization

To customize which packages are installed:

1. Open `Ubuntu.sh` or `Fedora.sh` in your editor
2. Comment out (`#`) the lines or sections you don't need
3. Save and run the modified script

## 📝 Prerequisites

- Fresh Linux installation or existing system
- sudo access
- Internet connection
- About 30+ minutes for full installation

## ⚠️ Disclaimer

These scripts make system-level changes. Review the contents before running, especially if modifying for production use. Test on a non-critical system first if you're unfamiliar with the commands.
