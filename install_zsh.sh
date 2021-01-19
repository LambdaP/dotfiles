#!/bin/bash

set -e

cp -a "$HOME/.zshenv" "$HOME/.zshenv-COPY-$(date +"%Y%m%d%H%M%S")" &&
  rm -f "$HOME/.zshenv"

stow -v zshenv --dotfiles --target="$HOME"

ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

mkdir -p "$ZDOTDIR"
stow -v zsh --dotfiles --target="$ZDOTDIR"
