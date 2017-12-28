# #!/bin/sh

DOTFILES=$(pwd)
ZSH_CONFIG_DIR=$HOME/.config/zsh

# Save previous .zshrc file
if [ -e ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.pre_script
fi

# Symlink zsh config files
mkdir -p $ZSH_CONFIG_DIR
stow -v zsh --target=$HOME
stow -v zsh --target=$HOME --dir=$DOTFILES/local

# Install zplug

git submodule init
git submodule update

stow -v zplug --target=$HOME

chsh -s /bin/zsh
