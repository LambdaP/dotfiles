#!/bin/sh

CURR_DIR=$(pwd)

./install_vi.sh
./install_zsh.sh

echo "Install git config."
ln -sf $CURR_DIR/git/gitconfig ~/.gitconfig

echo "Install ghci config."
ln -sf $CURR_DIR/ghci ~/.ghci
