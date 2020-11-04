#!/bin/sh

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

## Configuration files

stow -v --target=$XDG_CONFIG_HOME git

stow -v --target=$HOME      taskwarrior  --dotfiles
stow -v --target=$HOME      editorconfig --dotfiles

## Binaries

LOCAL_BIN="/usr/local/bin"

mkdir -p $LOCAL_BIN

stow -v --target=$LOCAL_BIN textidote
