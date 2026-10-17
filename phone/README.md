# phone

Phone on **Termux** (F-Droid, aarch64), reachable over SSH from the PC.

## Install on the phone

```sh
curl -fsSL https://raw.githubusercontent.com/nnavales/dotfiles/main/phone/termux/setup | bash
```

Deploys the dotfiles, applies the sshd hardening, installs
`openssh net-tools ripgrep rsync`, and starts sshd. Idempotent.

## PC commands

- `phone-config-export` — pull the phone's safe config into this repo
- `phone-backup` — full backup of the phone's `~` → `~/termux-backup/`

## Notes

- `ssh phone` (PC's `~/.ssh/config`, port 8022)
- After rebooting the phone, run `srv` in Termux to bring the server up.
