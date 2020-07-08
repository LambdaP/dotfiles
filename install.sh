#!/bin/sh

CURR_DIR=$(pwd)

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

./install_vi.sh
./install_zsh.sh

stow -v --target=$XDG_CONFIG_HOME git
stow -v --target=$HOME            ghci
stow -v --target=$HOME            spacemacs
stow -v --target=$HOME            thesaurus  --ignore="zip" --ignore="sh"
