#!/usr/bin/env bash
set -e

# 1. Check for Neovim and install if missing
if ! command -v nvim >/dev/null 2>&1; then
  echo "Neovim not found. Attempting to install..."
  if command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y neovim
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y neovim
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y neovim
  else
    echo "No supported package manager found. Please install Neovim manually."
    exit 1
  fi
else
  echo "Neovim is already installed."
fi

# 2. Check for git and install if missing
if ! command -v git >/dev/null 2>&1; then
  echo "git not found. Attempting to install..."
  if command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y git
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y git
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y git
  else
    echo "No supported package manager found. Please install git manually."
    exit 1
  fi
else
  echo "git is already installed."
fi

# 3. Symlink config to ~/.config/nvim
CONFIG_DIR="$HOME/.config"
NVIM_DIR="$CONFIG_DIR/nvim"

mkdir -p "$CONFIG_DIR"
if [ -L "$NVIM_DIR" ] || [ -d "$NVIM_DIR" ]; then
  rm -rf "$NVIM_DIR"
fi
ln -sfn "$(pwd)" "$NVIM_DIR"
echo "Symlinked $(pwd) to $NVIM_DIR"

# 4. Print instructions
cat <<EOF

========================================
Setup complete!

Now open Neovim with:
  nvim

Plugins will be installed automatically on first launch using lazy.nvim.
Use :Lazy in Neovim for plugin management commands.
========================================
EOF 