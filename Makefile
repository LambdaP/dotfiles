# This Makefile puts in place several tools that I like.
CURR_DIR = $(shell pwd)

.PHONY: all

all:
	$(CURR_DIR)/install.sh
	$(CURR_DIR)/install_mac.sh

programs: brews casks

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

casks: $(CASKS:%=cask-%)

brews: homebrew $(BREWS:%=brew-%)

brew-%: homebrew
	@echo "Homebrew: installing $*..."
	-@brew install $*
	@echo "Done."

brewremove-%: homebrew
	@echo "Homebrew: removing $*..."
	-@brew uninstall $*
	@echo "Done."

cask-%:
	@echo "Brew-cask: installing $*..."
	-@brew cask install $*
	@echo "Done."

# Fish setup

.PHONY: addfish

addfish:
	@echo "Fish: adding Fish in shell list..."
	@sudo echo "/usr/local/bin/fish" >> /etc/shells
	@echo "Fish: done."
