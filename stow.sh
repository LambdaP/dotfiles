#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

## Configuration files

stow -v --no-folding --target=$XDG_CONFIG_HOME kitty
stow -v --no-folding --target=$XDG_CONFIG_HOME git
stow -v --no-folding --target=$XDG_CONFIG_HOME htop
stow -v --no-folding --target=$XDG_CONFIG_HOME latexmk

stow -v editorconfig  --dotfiles --target=$HOME
# stow -v taskwarrior   --dotfiles --target=$HOME

## Binaries

LOCAL_BIN="/usr/local/bin"

mkdir -p $LOCAL_BIN

stow -v textidote  --no-folding --target=$LOCAL_BIN
