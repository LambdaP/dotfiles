#!/bin/sh

CURR_DIR=$(pwd)

mkdir -p ./config{vim,nvim,zsh}

echo "Link .vimrc."
if [ -e ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.pre_script
fi

ln -sf $CURR_DIR/vimrc ~/.vimrc

echo "Install vim-plug for vim."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim

echo "Link nvim/init.vim."
if [-e ~/.config/nvim/init.vim ]
then
        mv ~/.config/nvim ~/.config/nvim.pre_script
fi

ln -sf $CURR_DIR/nvim/* ~/.config/nvim/

echo "Install vim-plug for neovim."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

echo "Install git config."
ln -sf $CURR_DIR/git/gitconfig ~/.gitconfig

echo "Install ghci config."
ln -sf $CURR_DIR/ghci ~/.ghci
