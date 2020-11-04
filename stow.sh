#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

## Configuration files

stow -v kitty         --no-folding --target=$XDG_CONFIG_HOME
stow -v powerlevel10k --no-folding --target=$XDG_CONFIG_HOME --dotfiles
stow -v git           --no-folding --target=$XDG_CONFIG_HOME

stow -v editorconfig  --dotfiles --target=$HOME
stow -v taskwarrior   --dotfiles --target=$HOME

## Binaries

LOCAL_BIN="/usr/local/bin"

mkdir -p $LOCAL_BIN

stow -v textidote  --no-folding --target=$LOCAL_BIN
