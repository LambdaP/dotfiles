#!/bin/sh

CURR_DIR=$(pwd)

./install_vi.sh
./install_zsh.sh # TODO: update this

stow prezto --target=$HOME
stow git    --target=$HOME
stow ghci   --target=$HOME
