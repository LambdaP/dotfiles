#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

NVIMDOTDIR=$XDG_CONFIG_HOME/nvim

mkdir -p $NVIMDOTDIR

echo "Installing neovim."

stow -v neovim --no-folding --target=$NVIMDOTDIR

echo "Installing vim-plug."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins."
nvim +PlugInstall
