# nvim-dotfiles

## 🚀 Quick Start: The One-Liner Wonder

Want a sane, modern Neovim setup on any machine in seconds? Just run this command and watch the magic happen:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/000geid/nvim-dotfiles/refs/heads/main/install.sh)
```

No need to clone, copy, or pray to the config gods. This script will:
- Install Neovim and git if you somehow don’t have them
- Symlink this config to `~/.config/nvim` (overwriting any old cruft)
- Prompt you to open Neovim, where plugins will install themselves

## What is this?

This repo gives you a set of battle-tested, sensible Neovim defaults. It’s designed for:
- Fresh VPS setups
- Developer workstations
- Anyone who wants to get coding, not configuring

## Manual Install (for the cautious)

If you prefer to do things the old-fashioned way:

```sh
git clone https://github.com/000geid/nvim-dotfiles.git
cd nvim-dotfiles
./install.sh
```

## What’s Inside?
- Modular Lua config for speed and clarity
- Auto-bootstrapping plugin manager (packer.nvim)
- Tasty defaults for coding, navigation, and more

## FAQ
**Q: Will this nuke my old Neovim config?**  
A: Yes, but only in `~/.config/nvim`. Back it up if you’re sentimental.

**Q: What if I’m on macOS or Windows?**  
A: This script is for Linux. Mac users can adapt it; Windows users, you’re on your own (for now).

---

Enjoy your new Neovim superpowers. If you break something, you probably learned something too.
