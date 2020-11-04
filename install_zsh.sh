#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

## Ensure ZSH config directory exists
### NOTE: you should check whether /etc/zshenv is fine with you

if [ -z ${ZDOTDIR+x} ]; then
  # on OSX
  SYSTEM_ZSH_ENV=/etc/zshenv

  [ -f $SYSTEM_ZSH_ENV ] && sudo touch $SYSTEM_ZSH_ENV
  sudo echo "export ZDOTDIR=$HOME/.config/zsh" >> $SYSTEM_ZSH_ENV

  ZDOTDIR=$XDG_CONFIG_HOME/zsh
  mkdir -p $ZDOTDIR
fi

# Symlink zsh config files

stow -v --target=$ZDOTDIR --dotfiles

# install Zim
# curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
