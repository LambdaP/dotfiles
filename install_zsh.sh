# #!/bin/sh

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config
ZSH_CONFIG_DIR=$XDG_CONFIG_HOME/zsh

DOTFILES=$(pwd)

# Save previous .zshrc file
[ -e ~/.zshrc ] &&	mv ~/.zshrc ~/.zshrc.pre_script

# Symlink zsh config files
mkdir -p $ZSH_CONFIG_DIR
stow -v zsh      --target=$HOME
stow -v zsh      --target=$HOME --dir=$DOTFILES/local
stow -v starship --target=$HOME

# Install zplug

git submodule init
git submodule update

stow -v zplug --target=$HOME

chsh -s /bin/zsh
