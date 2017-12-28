# FIXME As it is, this script does not set up zsh properly
# #!/bin/sh

CURR_DIR=$(pwd)
ZSH_CONFIG_DIR=$HOME/.config/zsh

mkdir -p ZSH_CONFIG_DIR

stow -v zsh --target=$HOME
stow -v zsh --target=$HOME --dir=$CURR_DIR/local

echo "Install zshrc."
if [ -e ~/.zshrc ]
then
	mv ~/.zshrc ~/.config/zshrc.pre_script
fi

echo "source $ZSH_CONFIG_DIR/zsh.config" > ~/.zshrc

# TODO: this should be replaced with deployment of the theme as it is nowadays.
# echo "Install oh-my-zsh and the Elisa theme."
# git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh
# ln -sf $CURR_DIR/zsh/elisa.zsh-theme ~/.config/oh-my-zsh/themes
# mkdir -p ~/bin
# ln -sf $CURR_DIR/zsh/batcharge.py ~/bin

echo "Change default shell to zsh."
chsh -s /bin/zsh
