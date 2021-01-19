#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

NVIMDOTDIR=$XDG_CONFIG_HOME/nvim

mkdir -p $NVIMDOTDIR

echo "Installing neovim."

stow -v neovim --no-folding --target=$NVIMDOTDIR
