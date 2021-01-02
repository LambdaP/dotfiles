#!/bin/bash

set -e

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

## Ensure ZSH config directory exists
### NOTE: you should check whether /etc/zshenv is fine with you

if [ -z ${ZDOTDIR+x} ]; then
  printf "The environment variable ZDOTDIR is unset." && echo

  ZDOTDIR=$XDG_CONFIG_HOME/zsh

  SYSTEM_ZSH_ENV=/etc/zshenv

  read -e -r -p "Set ZDOTDIR in ${SYSTEM_ZSH_ENV}? [y/N] (requires sudo): " yn
  if [[ "$yn" == [Yy] ]]; then
      sudo touch $SYSTEM_ZSH_ENV
      sudo echo "export ZDOTDIR=${ZDOTDIR}" | sudo tee -a $SYSTEM_ZSH_ENV
  fi
  # on OSX

fi

# Symlink zsh config files

mkdir -p "$ZDOTDIR"
stow -v zsh --dotfiles --target="$ZDOTDIR"

# install Zim
# curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
