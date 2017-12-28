# #!/bin/sh

DOTFILES=$(pwd)
ZSH_CONFIG_DIR=$HOME/.config/zsh
ZPLUG_HOME=$HOME/.zplug

stow -Dv zsh   --target=$HOME --dir=$DOTFILES/local
stow -Dv zsh   --target=$HOME
stow -Dv zplug --target=$HOME

if [ -e ~/.zshrc.pre_script ]
then
	mv ~/.zshrc.pre_script ~/.zshrc
fi
