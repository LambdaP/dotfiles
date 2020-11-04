#!/bin/zsh -f

[ -z ${XDG_CONFIG_HOME+x} ] && XDG_CONFIG_HOME=$HOME/.config

./install_vi.sh
./install_zsh.sh

stow -v --target=$HOME            ghci
stow -v --target=$HOME            spacemacs
stow -v --target=$HOME            thesaurus  --ignore="zip" --ignore="sh"
