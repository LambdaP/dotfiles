# #!/bin/sh

DOTFILES=$(pwd)
ZSH_CONFIG_DIR=$HOME/.config/zsh

# Save previous .zshrc file
if [ -e ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.pre_script
fi

# Symlink zsh config files
mkdir -p $ZSH_CONFIG_DIR
stow -Rv zsh --target=$HOME --dir=$DOTFILES/local
stow -Rv zsh --target=$HOME

# Install zplug

git submodule init
git submodule update

stow -Rv zplug --target=$HOME

ZPLUG_HOME=$HOME/.zplug

# Symlink prompt_elisa_setup into zplug directly because I can't figure out
# how to add an external prompt to prezto.
mkdir -p $ZPLUG_HOME/repos/sorin-ionescu/prezto/modules/prompt/functions
stow -Rv prezto --target=$ZPLUG_HOME/repos/sorin-ionescu

chsh -s /bin/zsh
