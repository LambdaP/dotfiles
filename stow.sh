#!/bin/sh

LOCAL_BIN="/usr/local/bin"

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

stow -v --target=$LOCAL_BIN textidote
stow -v --target=$HOME      taskwarrior --dotfiles
