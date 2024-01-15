#!/bin/bash


echo "Setting up my Debian..."


if test ! "$(which starship)"; then
  curl -sS https://starship.rs/install.sh | sh
fi

if test ! "$(which delta)"; then
  curl -LS https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb -o git-delta.deb
  sudo apt install "$HOME"/git-delta.deb
  rm -i "$HOME"/git-delta.deb
fi

if test ! "$(which nvim)"; then
  curl -LS  https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o "$HOME"/.local/bin/nvim
  chmod +x "$HOME"/.local/bin/nvim
fi

if test ! "$(which rga-preproc)"; then
  github="https://github.com/phiresky/ripgrep-all/releases/download/v1.0.0-alpha.5/"
  name="ripgrep_all-v1.0.0-alpha.5-x86_64-unknown-linux-musl"
  curl -LS  "$github$name.tar.gz" -o "$HOME/.local/bin/$name.tar.gz"
  tar -xf "$HOME"/.local/bin/$name -C "$HOME"/.local/bin/ --strip-components 1 $name/{rga,rga-preproc}
  rm -vi "$HOME/.local/bin/$name.tar.g"z
fi

sudo apt install $(cat packages.txt)
