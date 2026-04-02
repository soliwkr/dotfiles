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

# Ensure age key is present (required to decrypt rclone.conf and other secrets)
AGE_KEY="$HOME/.config/chezmoi/key.txt"
if [[ ! -f "$AGE_KEY" ]]; then
  info "Age key not found at $AGE_KEY"
  echo ""
  echo "This dotfiles repo uses age encryption for secrets (rclone.conf, etc.)."
  echo "You must copy your age private key to this machine before continuing."
  echo ""
  echo "From your existing machine, run:"
  echo "  scp ~/.config/chezmoi/key.txt $(whoami)@$(hostname):~/.config/chezmoi/key.txt"
  echo ""
  echo "Or paste the key content now (end with Ctrl-D on a blank line):"
  mkdir -p "$(dirname "$AGE_KEY")"
  cat > "$AGE_KEY"
  chmod 600 "$AGE_KEY"
  success "Age key saved."
fi

# Apply dotfiles (chezmoi handles package install via run_once scripts)
info "Applying dotfiles from $CHEZMOI_REPO..."
chezmoi init --apply "$CHEZMOI_REPO"

success "Done! Log out and back in (or reboot) to load the desktop environment."
