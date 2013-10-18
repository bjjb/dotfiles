# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

d=$HOME/.dotfiles
[ -r $d/env.bash ] && source $d/env.bash

# Anything potentially slow and non-essential for a non-interactive session
# should be loaded in .bash_profile instead.
