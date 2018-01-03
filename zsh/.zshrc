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
zplug "modules/prompt",       from:prezto #, \
			      # hook-build:"ln -sf $HOME/.config/zsh/prompt_elisa_setup $ZPLUG_HOME/repos/sorin-ionescu/prezto/modules/prompt/functions"
            # FIXME: that hook fails, and the module does not get loaded.

zplug load

## Configure zsh

alias vi=nvim

# Source local configuration files
source ~/.config/zsh/path.config
source ~/.config/zsh/alias.config
source ~/.config/zsh/zsh_mac.config

# TMUX
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [[ -z "$TMUX" ]] then;
       if tmux has-session; then
         tmux attach
       else
         tmux new-session
       fi
    fi
fi


## Load prompt
prompt elisa
