# dotfiles
My Arch Linux environment setup.

### Wallpapers
They live in a separate private repo, [`nnavales/wallpapers`][wallpapers], and
dotfiles no longer syncs them. `~/.local/share/wallpapers` is a symlink to the
clone, which is what `hyprpaper` and the launcher read.

```sh
git clone git@github.com:nnavales/wallpapers.git ~/personal/wallpapers
ln -sfn ~/personal/wallpapers ~/.local/share/wallpapers
```

Add a new one by dropping the file in the clone and running `./gallery.sh`
there; commit and push. [See the gallery →][wallpapers]

[wallpapers]: https://github.com/nnavales/wallpapers

### Requirements
Arch Linux (or Arch-based distro)

### Setup
```sh
curl -Lo setup https://raw.githubusercontent.com/nnavales/dotfiles/main/setup && chmod +x setup && sudo ./setup
```

