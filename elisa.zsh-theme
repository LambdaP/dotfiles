# Elisa Oh-my-zsh! theme
# Designed by Patrick Lambein
# Inspired by Steve Losh's .zshrc 
# (http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/)
# and by the Nethack Zsh Prompt
# (http://eseth.org/2009/nethack-term.html)
# 11 march 2013
#
BAT_CHARGE=~/bin/batcharge.py

# Load colors
autoload -U colors && colors
local reset white gray green red

reset="%{${reset_color}%}"
magenta="%{$fg[magenta]%}"
white="%{$fg[white]%}"
gray="%{$fg_bold[black]%}"
green="%{$fg_bold[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"

#  Show battery life
function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

# Show directory type
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function setprompt() {
local -a infoline llines rlines 
local i_width i_filler filler

infoline+="╭─"
infoline+=(${white}'%n'${reset})		# Me
[[ -n $SSH_CLIENT ]] && infoline+=( "@${yellow}%m${reset}" )
										# My host, if in SSH
	infoline+=(" in ")
[[ -w $PWD ]] && infoline+=(${green}) || infoline+=(${yellow})
	infoline+=($(collapse_pwd)" "${reset})		# Current directory
infoline+=( $(battery_charge) )

i_width=${(S)infoline//\%\{*\%\}}
i_width=${#${(%)i_width}}

i_filler=$(($COLUMNS - $i_width + 5))

filler="${gray}${(l:${i_filler}::─:)}${reset}"
[[ -n $SSH_CLIENT ]] && infoline[6]=( "${infoline[6]}${filler}" )\
	|| infoline[5]=( "${infoline[5]}${filler}" )  

llines+=( ${(j::)infoline} )
llines+=( "╰─($(prompt_char) %(!.#.$) ")
rlines+=("$(git_prompt_info)")

PROMPT=${(F)llines}
RPROMPT=${(F)rlines}
}

# ZSH prompt display option
ZSH_THEME_GIT_PROMPT_PREFIX="["${magenta}
ZSH_THEME_GIT_PROMPT_SUFFIX=${reset}"]"
ZSH_THEME_GIT_PROMPT_DIRTY="${green}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${green}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function precmd {
	setprompt
}
