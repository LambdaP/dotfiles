# This Makefile puts in place several tools that I like.
CURR_DIR = $(shell pwd)

.PHONY: all

all: vim zsh git ghci

programs: brews casks # cabals because Cabal.

~/.config:
	@mkdir -p ~/.config

# Vim setup

VIM_PLUGINS = solarized syntastic

.PHONY: vim pathogen $(VIM_PLUGINS)

vim: ~/.vimrc ~/.vim/bundle pathogen $(VIM_PLUGINS)

pathogen: ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim

solarized: ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim

syntastic: ~/.vim/bundle/syntastic/plugin/syntastic.vim

~/.vimrc:
	-ln -s $(CURR_DIR)/vimrc ~/.vimrc

~/.vim/bundle:
	@mkdir -p ~/.vim/bundle

~/.vim/bundle/vim-pathogen/autoload/pathogen.vim: ~/.vim/bundle
	@echo "Vim: installing pathogen..."
	@mkdir -p ~/.vim/bundle/vim-pathogen/autoload
	@curl -LSso ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	@echo "Vim: done."

~/.vim/bundle/vim-colors-solarized/colors/solarized.vim: ~/.vim/bundle
	@echo "Vim: installing the Solarized color set..."
	@git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
	@echo "Vim: done."

~/.vim/bundle/syntastic/plugin/syntastic.vim: ~/.vim/bundle
	@echo "Vim: installing syntastic..."
	@git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
	@echo "Vim: done."

# Zsh setup

.PHONY: zsh oh-my-zsh elisa

zsh: oh-my-zsh elisa
	@echo "Zsh: installing config files..."
	-@mv ~/.zshrc ~/.zshrc.pre_script
	@mkdir -p ~/.config/zsh
	echo "source $$HOME/.config/zsh/zsh.config" > ~/.zshrc
	-@ln -s $(CURR_DIR)/zsh/zsh.config ~/.config/zsh
	@touch $(CURR_DIR)/zsh/private/path.config
	-@ln -s $(CURR_DIR)/zsh/private/path.config ~/.config/zsh
	@touch $(CURR_DIR)/zsh/private/alias.config
	-@ln -s $(CURR_DIR)/zsh/private/alias.config ~/.config/zsh
	@echo "Zsh: done. Changing default shell to zsh:"
	chsh -s /bin/zsh

oh-my-zsh: ~/.config/oh-my-zsh

elisa: ~/.config/oh-my-zsh/themes/elisa.zsh-theme ~/bin/batcharge.py

~/.config/oh-my-zsh: ~/.config
	@echo "Zsh: installing oh-my-zsh..."
	@git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh
	@echo "Zsh: done."

~/.config/oh-my-zsh/themes/elisa.zsh-theme: ~/.config/oh-my-zsh
	@echo "Zsh: installing the Elisa theme..."
	-ln -s $(CURR_DIR)/zsh/elisa.zsh-theme ~/.config/oh-my-zsh/themes
	@echo "Zsh: done."

~/bin/batcharge.py:
	@mkdir -p ~/bin
	-@ln -s $(CURR_DIR)/zsh/batcharge.py ~/bin

# Git setup

.PHONY: git

git:
	@echo "Git: installing config file..."
	-@ln -s $(CURR_DIR)/git/gitconfig ~/.gitconfig
	@echo "Git: done."

# Ghci setup

.PHONY: ghci

ghci:
	@echo "GHCI: installing config file..."
	-@ln -s $(CURR_DIR)/gich ~/.ghci
	@echo "GHCI: done."

# Homebrew setup

.PHONY: homebrew cask brews casks

BREWS= # Programs to be installed by Homebrew
BREWS+=brew-cask
BREWS+=ctags
BREWS+=ddate
BREWS+=ffmpeg
BREWS+=fish
BREWS+=fortune
BREWS+=ghc
BREWS+=git
BREWS+=irssi
BREWS+=lftp
BREWS+=readline
BREWS+=rlwrap
BREWS+=sl
BREWS+=ssh-copy-id
BREWS+=sshuttle
BREWS+=tree
BREWS+=wget
BREWS+=cmake

CASKS= # GUI programs to be installed by Homebrew
CASKS+=bittorrent-sync
CASKS+=dropbox
CASKS+=electric-sheep
CASKS+=google-drive
CASKS+=filezilla
CASKS+=firefox
CASKS+=flux
CASKS+=iterm2
CASKS+=launchrocket
CASKS+=mactex
CASKS+=menumeters
CASKS+=spotify
CASKS+=steam
CASKS+=virtualbox
CASKS+=wireshark

homebrew: /usr/local/bin/brew

cask: /usr/local/bin/brew-cask.rb

casks: cask $(CASKS:%=cask-%)

brews: homebrew $(BREWS:%=brew-%)

brew-%: homebrew
	@echo "Homebrew: installing $*..."
	-@brew install $*
	@echo "Done."

brewremove-%: homebrew
	@echo "Homebrew: removing $*..."
	-@brew uninstall $*
	@echo "Done."

cask-%: cask
	@echo "Brew-cask: installing $*..."
	-@brew cask install $*
	@echo "Done."

/usr/local/bin/brew:
	@echo "Installing Homebrew..."
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@echo "Done. Running brew doctor..."
	@brew doctor

/usr/local/bin/brew-cask.rb: homebrew
	@echo "Installing brew-cask..."
	@brew install caskroom/cask/brew-cask
	@echo "Done."

# Haskell setup

.PHONY: haskell cabals

CABALS=
CABALS+=pandoc
CABALS+=hakyll # Does not work, because Cabal.
CABALS+=hoogle

# Heaven forbids you rund this in multicore mode.
haskell: cabal cabal-cabal-install brewremove-cabal-install cabals

cabal: brew-cabal-install
	cabal update

cabals: $(CABALS:%=cabal-%)

cabal-%:
	@echo "Cabal: installing $*..."
	-@cabal install $*
	@echo "Done."

# Fish setup

# todo

.PHONY: addfish

addfish:
	@echo "Fish: adding Fish in shell list..."
	@sudo echo "/usr/local/bin/fish" >> /etc/shells
	@echo "Fish: done."
