# #!/bin/sh

DOTFILES=$(pwd)
ZSH_CONFIG_DIR=$HOME/.config/zsh

# Symlink zsh config files
mkdir -p ZSH_CONFIG_DIR

# Save previous .zshrc file
if [ -e ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.pre_script
fi

stow -v zsh --target=$HOME
stow -v zsh --target=$HOME --dir=$DOTFILES/local

# Install zplug

git submodule init
git submodule update

stow -v zplug --target=$HOME

ZPLUG_HOME=$HOME/.zplug

# Symlink prompt_elisa_setup into zplug directly because I can't figure out
# how to add an external prompt to prezto.
mkdir -p $ZPLUG_HOME/repos/sorin-ionescu/prezto/modules/prompt/functions
stow -v prezto --target=$ZPLUG_HOME/repos/sorin-ionescu

echo "Change default shell to zsh."
chsh -s /bin/zsh
