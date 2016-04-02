#!/bin/sh

CURR_DIR=$(pwd)

mkdir -p ~/.config/zsh

echo "Install oh-my-zsh and the Elisa theme."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh
ln -sf $CURR_DIR/zsh/elisa.zsh-theme ~/.config/oh-my-zsh/themes
mkdir -p ~/bin
ln -sf $CURR_DIR/zsh/batcharge.py ~/bin

echo "Install zshrc."
if [ -e ~/.zshrc ]
then
	mv ~/.zshrc ~/.config/zshrc.pre_script
fi

echo "source $HOME/.config/zsh/zsh.config" > ~/.zshrc

ln -sf $CURR_DIR/zsh/zsh.config ~/.config/zsh/
ln -sf $CURR_DIR/zsh/private/*  ~/.config/zsh/

echo "Change default shell to zsh."
chsh -s /bin/zsh
