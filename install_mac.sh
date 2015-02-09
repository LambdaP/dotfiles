#!/bin/sh

echo "Install Homebrew."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install brew-cask."
brew install caskroom/cask/brew-cask
