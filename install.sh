#!/bin/sh

CURR_DIR=$(pwd)

./install_vi.sh
./install_zsh.sh

stow git        --target=$HOME
stow ghci       --target=$HOME
stow spacemacs  --target=$HOME
