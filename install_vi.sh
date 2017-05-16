#!/bin/sh

CURR_DIR=$(pwd)

mkdir -p ~/.config/nvim

# Neovim

echo "Link nvim/init.vim."
if [ -e ~/.config/nvim/init.vim ]
then
        mv ~/.config/nvim ~/.config/nvim.pre_script
fi

ln -sf $CURR_DIR/nvim/* ~/.config/nvim/

echo "Install vim-plug for neovim."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
