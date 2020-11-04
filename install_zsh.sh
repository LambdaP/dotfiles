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
[ -z ${ZDOTDIR+x} ]         && ZDOTDIR=$XDG_CONFIG_HOME/zsh   && mkdir -p $ZDOTDIR

DOTFILES=$(pwd)

# Symlink zsh config files

stow -v --target=$ZDOTDIR --dotfiles

# stow -v zsh      --target=$HOME
stow -v zsh      --target=$HOME --dir=$DOTFILES/local

# install Zim
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
