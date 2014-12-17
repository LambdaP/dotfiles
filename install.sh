#!/bin/sh

CURR_DIR=$(pwd)

mkdir -p ./config

echo "Link .vimrc."
if [ -e ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.pre_script
fi

ln -sf $CURR_DIR/vimrc ~/.vimrc

echo "Install vim plugins."
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/bundle/vim-pathogen/autoload
curl -LSso ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

echo "Install oh-my-zsh and the Elisa theme."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh
ln -sf $CURR_DIR/zsh/elisa.zsh-theme ~/.config/oh-my-zsh/themes
mkdir -p ~/bin
ln -sf $CURR_DIR/zsh/batcharge.py ~/bin

echo "Install zshrc."
if [ -e ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.pre_script
fi

mkdir -p ~/.config/zsh
echo "source $HOME/.config/zsh/zsh.config" > ~/.zshrc
ln -sf $CURR_DIR/zsh/zsh.config ~/.config/zsh
touch  $CURR_DIR/zsh/private/path.config
ln -sf $CURR_DIR/zsh/private/path.config ~/.config/zsh
touch  $CURR_DIR/zsh/private/alias.config
ln -sf $CURR_DIR/zsh/private/alias.config ~/.config/zsh

echo "Change default shell to zsh."
chsh -s /bin/zsh

echo "Install git config."
ln -sf $CURR_DIR/git/gitconfig ~/.gitconfig

echo "Install ghci config."
ln -sf $CURR_DIR/ghci ~/.ghci
