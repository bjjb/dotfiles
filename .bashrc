# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

[ -r ~/.dotfiles/env.bash ] && source ~/.dotfiles/env.bash
[ -r ~/.dotfiles/ruby.bash ] && source ~/.dotfiles/ruby.bash
[ -r ~/.dotfiles/prompt.bash ] && source ~/.dotfiles/prompt.bash
[ -r ~/.dotfiles/completion.bash ] && source ~/.dotfiles/completion.bash

# Anything potentially slow and non-essential for a non-interactive session
# should be loaded in .bash_profile instead.
