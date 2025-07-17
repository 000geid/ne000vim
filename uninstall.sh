#!/usr/bin/env bash
set -e

CONFIG_DIR="$HOME/.config"
NVIM_DIR="$CONFIG_DIR/nvim"
REPO_DIR="$(pwd)"

# Only remove ~/.config/nvim if it is a symlink to this repo
if [ -L "$NVIM_DIR" ] && [ "$(readlink "$NVIM_DIR")" = "$REPO_DIR" ]; then
  rm "$NVIM_DIR"
  echo "Removed symlink: $NVIM_DIR -> $REPO_DIR"
else
  echo "$NVIM_DIR is not a symlink to this repo. Skipping removal."
fi

# Optionally remove Neovim data (plugins, lazy.nvim)
read -p "Do you want to remove all Neovim data (plugins, lazy.nvim)? [y/N]: " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  DATA_DIR="$HOME/.local/share/nvim"
  rm -rf "$DATA_DIR"
  echo "Removed Neovim data directory: $DATA_DIR"
else
  echo "Neovim data directory left intact."
fi

echo "Uninstall complete." 