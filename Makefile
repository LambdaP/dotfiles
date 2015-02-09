# This Makefile puts in place several tools that I like.
CURR_DIR = $(shell pwd)

.PHONY: all

all:
	$(CURR_DIR)/install.sh
	$(CURR_DIR)/install_mac.sh

programs: brews casks # cabals because Cabal.

# Homebrew setup

.PHONY: brews casks

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
CASKS+=calibre
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
CASKS+=vlc
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
