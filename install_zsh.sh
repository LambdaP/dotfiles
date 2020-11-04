# #!/bin/sh

# NOTE: you should check whether /etc/zshenv is fine with you

#if [ -z ${ZDOTDIR+x} ] then
#  # on OSX
#  SYSTEM_ZSH_ENV=/etc/zshenv
#
#  [ -f $SYSTEM_ZSH_ENV ] && sudo touch $SYSTEM_ZSH_ENV
#  sudo echo "export ZDOTDIR=$HOME/.config/zsh" >> $SYSTEM_ZSH_ENV
#fi

## Ensure ZSH config directory exists

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

CONFIG_ZSH=$XDG_CONFIG_HOME/zsh

mkdir -p $CONFIG_ZSH

DOTFILES=$(pwd)

# Save previous .zshrc file
# [ -e ~/.zshrc ] &&	mv ~/.zshrc ~/.zshrc.pre_script

# Symlink zsh config files

stow -v --target=$CONFIG_ZSH --dotfiles

# stow -v zsh      --target=$HOME
stow -v zsh      --target=$HOME --dir=$DOTFILES/local

# stow -v starship --target=$HOME

# install Zim
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
