#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

NVIMDOTDIR=$XDG_CONFIG_HOME/nvim

mkdir -p $NVIMDOTDIR

echo "Installing neovim."

stow -v neovim --no-folding --target=$NVIMDOTDIR

git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

echo "Installing plugins."
nvim +PlugInstall
