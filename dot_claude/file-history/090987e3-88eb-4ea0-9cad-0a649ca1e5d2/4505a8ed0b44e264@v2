---
name: Zsh Setup In Progress
description: Ongoing zsh configuration and troubleshooting (2026-04-06)
type: project
---

## Current Status
- Shell: Still defaulting to **bash** (need to set zsh as default)
- Zsh: Installed (`/usr/bin/zsh 5.9`), but `.zshrc` has errors with zle option
- Goal: Make zsh default shell with pimp config

## Problem
- `.zshrc` causes error: "can't change option: zle"
- Likely caused by compinit or plugin loading order
- Using minimal .zshrc workaround

## Current Minimal .zshrc
```bash
eval "$(starship init zsh)"
alias gs='git status'
alias ga='git add .'
alias glg='lazygit'
alias cat=bat
```

## Next Steps
1. Test minimal .zshrc with `/usr/bin/zsh`
2. If works, gradually add back:
   - Direnv hook
   - FZF keybindings
   - Aliases
   - Then plugins (zinit)
3. Set zsh as default: `chsh -s /usr/bin/zsh` or `sudo usermod -s /usr/bin/zsh soliwkr`

## Completed Setup (Already working)
✅ Starship prompt
✅ Tmux (with TPM, resurrection, custom theme)
✅ Neovim (LazyVim + plugins)
✅ Modern CLI tools (fzf, rg, bat, lsd, btm, direnv)
✅ Git lazy aliases
✅ Chezmoi dotfiles management
✅ Hyprland keyboard repeat tuning

## Files to Track in Chezmoi
- `~/.zshrc` (needs to be finalized)
- `~/.config/starship.toml`
- `~/.config/tmux/tmux.conf`
- `~/.config/nvim/`
- `~/.config/direnv/`
- `~/.local/bin/` (scripts)
