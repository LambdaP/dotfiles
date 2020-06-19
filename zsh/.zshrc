## Set up zplug

export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# TODO: this is imported from the Prezto config files I used to use.
#       It would probably be a good idea to go through and see which one I like.
zplug "modules/environment",  from:prezto
zplug "modules/terminal",     from:prezto
zplug "modules/editor",       from:prezto
zplug "modules/history",      from:prezto
zplug "modules/directory",    from:prezto
zplug "modules/spectrum",     from:prezto
zplug "modules/utility",      from:prezto
zplug "modules/completion",   from:prezto
# zplug "modules/prompt",       from:prezto #, \
			      # hook-build:"ln -sf $HOME/.config/zsh/prompt_elisa_setup $ZPLUG_HOME/repos/sorin-ionescu/prezto/modules/prompt/functions"
            # FIXME: that hook fails, and the module does not get loaded.

zplug load

## Configure zsh

# Source local configuration files
source ~/.config/zsh/path.config
source ~/.config/zsh/alias.config
source ~/.config/zsh/zsh_mac.config

## Load prompt
# prompt elisa

export CUPS_USER=plambein # to use printers @ INRIA

# Use nvim as manpager `:h Man`
export MANPAGER="nvim +Man! -c ':set signcolumn=' -c ':set colorcolumn=""'"
export MANWIDTH=999

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
