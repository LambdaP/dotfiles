#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

## Ensure ZSH config directory exists
### NOTE: you should check whether /etc/zshenv is fine with you

if [ -z ${ZDOTDIR+x} ]; then
  printf "The environment variable ZDOTDIR is unset."

  ZDOTDIR=$XDG_CONFIG_HOME/zsh

  SYSTEM_ZSH_ENV=/etc/zshenv

  printf "Set ZDOTDIR in ${SYSTEM_ZSH_ENV}? [y/N] (requires sudo): "
  if read -q; then
    echo; sudo touch $SYSTEM_ZSH_ENV &&
      sudo echo "export ZDOTDIR=${ZDOTDIR}" >> $SYSTEM_ZSH_ENV
  fi
  # on OSX

fi

# Symlink zsh config files

mkdir -p $ZDOTDIR
stow -v zsh --dotfiles --target=$ZDOTDIR

stow -v powerlevel10k --dotfiles --target=$XDG_CONFIG_HOME --no-folding

# install Zim
# curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
