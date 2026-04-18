# Piano: Workstation Stateless Completa su Omarchy

## Contesto
La macchina Arch/Omarchy ha già la base: chezmoi configurato, dati syncati (Vault 370M, Documenti 155M, Foto 7.7G), repos clonati. Mancano alcuni pezzi per rendere il bootstrap *completamente* autonomo su una macchina nuova.

## Stato attuale
- ✅ chezmoi con tutti i config (hypr, alacritty, ghostty, nvim, waybar, ecc.)
- ✅ run_once: pacchetti, SSH key gen, clone repos
- ✅ ~/Vault, ~/Documenti, ~/Foto, ~/Scripts, ~/Codice presenti con dati
- ✅ 1Password account loggato
- ❌ gitconfig non trackato (dot_config/git/ — verificare)
- ❌ nessun run_once crea le directory ~/Vault ~/Documenti ~/Foto ~/Scripts
- ❌ 3 repos in ~/Codice non nel clone script
- ❌ 4 chiavi SSH in /tmp/1p-import/ — import manuale in 1Password

## Azioni

### 1. Verifica e fix gitconfig in chezmoi
Controllare `~/.local/share/chezmoi/dot_config/git/config`.
Se mancante, aggiungerlo con template chezmoi:
```
[user]
    name = "{{ .name }}"
    email = "{{ .email }}"
[init]
    defaultBranch = main
[core]
    editor = nvim
[pull]
    rebase = false
```

### 2. Aggiungi run_once_before_05-dirs.sh
Script che crea la struttura directory canonicamente (idempotente):
```bash
mkdir -p ~/Codice ~/Vault ~/Documenti ~/Foto ~/Scripts
```
Deve girare PRIMA del clone repos.

### 3. Aggiorna clone repos script
Aggiungere i 3 repos presenti in ~/Codice ma assenti dallo script:
- `soliwkr/the-cross-seo` (verificare account GitHub)
- `soliwalker/verbum-lucis-king`
- `soliwalker/verbum-lucis-prototype`

### 4. Chiavi SSH → 1Password (manuale)
Le 4 chiavi in `/tmp/1p-import/` vanno importate via GUI 1Password:
- `id_ed25519` → "SSH Key - soliwkr main"
- `hetzner_soliwkr` → "SSH Key - Hetzner"
- `dokploy` → "SSH Key - Dokploy"
- `git_soliwalker_legacy` → "SSH Key - soliwalker legacy"
Poi: Settings → Developer → Use SSH Agent → abilitare

### 5. Documenti: pulizia file sensibili
`~/Documenti/Chrome Passwords.csv` e `~/Documenti/rev card.jpeg` — da spostare
in posto adeguato o eliminare (non in cartella documenti plain).

### 6. Git push chezmoi
Dopo tutte le modifiche, push a `git@github.com:soliwkr/dotfiles.git`.

## File critici da modificare
- `~/.local/share/chezmoi/dot_config/git/config` — creare se mancante
- `~/.local/share/chezmoi/run_once_after_20-clone-repos.sh.tmpl` — aggiungere repos
- Nuovo: `~/.local/share/chezmoi/run_once_before_05-dirs.sh` — creare

## Verifica finale (bootstrap test mentale)
Su macchina nuova, il comando:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply soliwkr
```
deve:
1. Installare pacchetti (Arch: yay + Omarchy; Fedora: dnf)
2. Creare ~/Codice ~/Vault ~/Documenti ~/Foto ~/Scripts
3. Generare SSH key
4. Clonare tutti i repos
Unica cosa manuale: importare le chiavi SSH in 1Password dopo.
