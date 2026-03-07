#!/usr/bin/env bash
# bootstrap.sh — spin up a fresh machine in minutes
#
# Usage (one-liner after SSH key or on a fresh machine):
#   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply soliwkr
#
# Or manually:
#   bash <(curl -fsSL https://raw.githubusercontent.com/soliwkr/dotfiles/master/.config/bootstrap.sh)

set -euo pipefail
info()    { echo -e "\033[1;34m==>\033[0m $*"; }
success() { echo -e "\033[1;32m✓\033[0m $*"; }

CHEZMOI_REPO="https://github.com/soliwkr/dotfiles"

# Detect distro
if [[ -f /etc/os-release ]]; then
  source /etc/os-release
  DISTRO="${ID:-unknown}"
else
  DISTRO="unknown"
fi

info "Detected distro: $DISTRO"

# Install chezmoi if missing
if ! command -v chezmoi &>/dev/null; then
  info "Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

# Apply dotfiles (chezmoi handles package install via run_once scripts)
info "Applying dotfiles from $CHEZMOI_REPO..."
chezmoi init --apply "$CHEZMOI_REPO"

success "Done! Log out and back in (or reboot) to load the desktop environment."
