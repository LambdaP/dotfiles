## Helper functions

function safe_source {
  [ -f $1 ] && source $1
}

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

unsetopt hist_verify

# Prompt: starship
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

## Configure zsh

DOTCONFIG=$HOME/.config

# Source local configuration files
safe_source "$DOTCONFIG/zsh/path.config"
safe_source "$DOTCONFIG/zsh/alias.config"
safe_source "$DOTCONFIG/zsh/zsh_mac.config"

# Use nvim as manpager `:h Man`
if command -v nvim &>/dev/null; then
  export MANPAGER="nvim +Man! -c ':set signcolumn=' -c ':set colorcolumn=""'"
  export MANWIDTH=999
fi

if command -v rg &>/dev/null; then
  # FZF confile
  # stolen here: https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko

  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

if command -v brew &>/dev/null; then
  # If "zsh compinit: insecure directories" warnings, run:
  #   chmod go-w '/usr/local/share'
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

export CUPS_USER=plambein # to use printers @ INRIA

safe_source "/Users/p/Library/Preferences/org.dystroy.broot/launcher/bash/br"
safe_source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
safe_source "~/.fzf.zsh"
safe_source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# safe_source "/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
