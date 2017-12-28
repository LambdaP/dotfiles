#!/bin/sh

CURR_DIR=$(pwd)

echo "Installing nvim."

if [ -e ~/.config/nvim ]
then
        mv ~/.config/nvim ~/.config/nvim.pre_script
fi

mkdir -p ~/.config/nvim # Do not symlink ~/.config/nvim to dotfiles/nvim
stow -v nvim --target=$HOME

echo "Installing vim-plug for neovim."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins."
nvim +PlugInstall
