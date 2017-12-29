dotfiles
========

The config files I use

## General principles

Config files are meant to be managed with GNU stow for the following tools: zsh,
  neovim, git, ghci.
The shell script install.sh installs them all.

Zsh is meant to be installed with install_zsh.sh.
This script downloads and installs zplug and symlinks the config files in the
  appropriate places.
It also links the content of local/zsh with stow.

Neovim is installed with install_vi.sh.
It downloads and installs vim-plug, symlinks the config files for neovim, and
  installs the plugins.

The script install_mac.sh downloads homebrew and prompts instructions for
  editing the sudoer file.

The Makefile describes an outdated list of packages to be installed by homebrew.
