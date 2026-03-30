# dotfiles — soliwkr

Setup completo in un comando su qualsiasi macchina.

## Bootstrap

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply soliwkr/dotfiles
```

Questo comando:
1. Installa chezmoi
2. Clona questo repo
3. Rileva automaticamente l'ambiente (desktop/server, distro)
4. Installa i pacchetti corretti
5. Copia tutti i config
6. Genera la chiave SSH
7. Clona i repo di lavoro
8. Sincronizza Vault e Documenti da OneDrive

## Ambienti supportati

| OS | Mode | Note |
|---|---|---|
| Arch/Omarchy | Desktop | Setup completo con Hyprland |
| Fedora | Desktop | Hyprland manuale |
| Ubuntu/Debian | Server o Desktop | TUI tools + opzionale GUI |
| Qualsiasi VPS | Server | Solo TUI tools |

## Dopo il bootstrap

Per sincronizzare la configurazione rclone (OneDrive/R2):
```bash
rclone config  # configura i remote
chezmoi apply  # rilancia il vault sync
```

## Struttura

```
~/
├── Codice/          ← repo clonati automaticamente
├── Documenti/       ← sync OneDrive
├── Vault/           ← Obsidian, sync OneDrive
├── Immagini/
├── Musica/
├── Scaricati/
├── Scrivania/
└── Video/
```
