#!/bin/sh

CURR_DIR=$(pwd)

echo "Installing nvim."

if [ -e ~/.config/nvim/init.vim ]
then
        mv ~/.config/nvim ~/.config/nvim.pre_script
fi

stow nvim

echo "Installing vim-plug for neovim."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins."
nvim +PlugInstall
