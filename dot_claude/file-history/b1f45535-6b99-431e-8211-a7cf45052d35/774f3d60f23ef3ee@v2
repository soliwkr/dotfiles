---
name: Terminal Setup Complete
description: Full lazy-god devops terminal environment on Omarchy (Arch Linux)
type: project
---

## Setup Completed
**Date**: 2026-04-06

Complete terminal stack installed and configured:

### Core Stack
- **Shell**: Zsh with starship prompt (instant, git-aware)
- **Multiplexer**: Tmux (C-Space prefix, vi-bindings, sessionizer)
- **Editor**: Neovim with LazyVim + LSP setup
- **Theme**: Integrated with Omarchy (symlinked theme.lua)

### Modern CLI Tools
- `fzf` - fuzzy finder (Ctrl+r history, Ctrl+t file picker)
- `ripgrep (rg)` - ultra-fast grep
- `bat` - syntax-highlighted cat (alias: cat→bat)
- `lsd` - ls with icons (alias: ls→lsd)
- `bottom (btm)` - system monitor (alias: top→btm)
- `direnv` - auto .envrc loading per-project
- `lazygit` - TUI git client
- `gh` - GitHub CLI

### Advanced Features
- **Tmux Persistence**: TPM + resurrect + continuum (auto-save every 15min)
- **Tmux Sessionizer**: Ctrl+j fuzzy jump to projects with auto-session creation
- **Direnv Templates**: python, node, go, rust, fullstack `.envrc` templates
- **Neovim Plugins**: fzf-lua, harpoon (mark 4 files), trouble, vim-fugitive, vim-surround, noice
- **Git Workflow**: Lazy abbreviations (gcp=commit+add, gpr=pull+rebase, gfp=fetch+pull, gpu=push-u)

### Abbreviations (Lazy Mode)
```bash
# Navigation
... = ../..
md = mkdir -p

# Git
gs, ga, gc, gp, gpl, gr, gb, gco, gd, gl, gcp, gpr, gf, gfp, gpu
gst = git stash (with optional message)

# Tools
glg = lazygit
ll = lsd -lA
da = direnv allow
tm = tmux
```

### Scripts Created
- `~/.local/bin/tmux-sessionizer` - Ctrl+j project jump
- `~/.local/bin/create-envrc` - Bootstrap .envrc from templates
- `~/.local/bin/terminal-setup-check` - Verify all components

### Chezmoi Status
✓ All configs tracked:
- `~/.zshrc`
- `~/.config/starship.toml`
- `~/.config/tmux/tmux.conf`
- `~/.config/nvim/lua/config/keymaps.lua`
- `~/.config/nvim/lua/plugins/lazy-god-essentials.lua`
- `~/.config/direnv/` (direnvrc + templates)
- `~/.local/bin/` (scripts)

Ready to deploy with: `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply soliwkr`
