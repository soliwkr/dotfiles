#!/usr/bin/env bash
# Crea struttura directory canonica (idempotente)
set -euo pipefail

mkdir -p   "$HOME/Codice"   "$HOME/Documenti"   "$HOME/Immagini"   "$HOME/Musica"   "$HOME/Scaricati"   "$HOME/Scrivania"   "$HOME/Video"   "$HOME/Vault"   "$HOME/Scripts"   "$HOME/Work"

echo "Directory canoniche create."
