# This first part is from Sorin Ionescu's Prezto.
# It is unclear whether it still serves a purpose.
# TODO: investigate
#
# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Greeting message.
ddate
echo ""
# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -a
    print
  fi
fi
