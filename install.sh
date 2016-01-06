#!/bin/sh

CURR_DIR=$(pwd)

mkdir -p ./config

echo "Link .vimrc."
if [ -e ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.pre_script
fi

ln -sf $CURR_DIR/vimrc ~/.vimrc

# Neovim

echo "Link nvim/init.vim."
if [-e ~/.config/nvim/init.vim ]
then
        mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.pre_script
fi

mkdir -p ~/.config/nvim

ln -sf $CURR_DIR/.config/init.vim ~/nvim.config

echo "Install vim-plug for vim."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
	mv ~/.zshrc ~/.zshrc.pre_script
fi

mkdir -p ~/.config/zsh
echo "source $HOME/.config/zsh/zsh.config" > ~/.zshrc
ln -sf $CURR_DIR/zsh/zsh.config ~/.config/zsh
touch  $CURR_DIR/zsh/private/path.config
ln -sf $CURR_DIR/zsh/private/path.config ~/.config/zsh
touch  $CURR_DIR/zsh/private/alias.config
ln -sf $CURR_DIR/zsh/private/alias.config ~/.config/zsh
touch $CURR_DIR/zsh/private/zsh_mac.config
ln -sf $CURR_DIR/zsh/private/zsh_mac.config ~/.config/zsh

echo "Change default shell to zsh."
chsh -s /bin/zsh

echo "Install git config."
ln -sf $CURR_DIR/git/gitconfig ~/.gitconfig

echo "Install ghci config."
ln -sf $CURR_DIR/ghci ~/.ghci
