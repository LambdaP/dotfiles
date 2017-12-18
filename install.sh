#!/bin/sh

CURR_DIR=$(pwd)

./install_vi.sh
./install_zsh.sh # TODO: update this

stow prezto
stow git
stow ghci
