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
zplug "modules/prompt",       from:prezto

zplug load

# Customize to your needs...
# User configuration.
ZSH_CONFIG=$HOME/.config/zsh

source $ZSH_CONFIG/zsh.config

# Load prompt
prompt elisa
