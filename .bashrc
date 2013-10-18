# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

[ -r ~/.dotfiles/env.bash ] && source ~/.dotfiles/env.bash
[ -r ~/.dotfiles/aliases.bash ] && source ~/.dotfiles/aliases.bash
[ -r ~/.dotfiles/prompt.bash ] && source ~/.dotfiles/prompt.bash
[ -r ~/.dotfiles/completion.bash ] && source ~/.dotfiles/completion.bash
[ -r ~/.dotfiles/chruby.bash ] && source ~/.dotfiles/chruby.bash

[ -d /usr/local/share/npm/bin ] && PATH=$PATH:/usr/local/share/npm/bin
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH

# Anything potentially slow and non-essential for a non-interactive session
# should be loaded in .bash_profile instead.
