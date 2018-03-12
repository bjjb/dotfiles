# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

# Standard PATH entries...
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d /usr/local/sbin ] && export PATH=/usr/local/sbin:$PATH

# User's home binaries
if [ -d $HOME/bin ]; then
  PATH=$HOME/bin:$PATH
fi

# Locale settings
export LANG="en_IE.UTF-8"
export LC_CTYPE="en_IE.UTF-8"

# Local Go installation
export GOPATH=$HOME

# Local Ruby installation
if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi
fi

# Heroku CLI
[ -d /usr/local/heroku/bin ] && export PATH="/usr/local/heroku/bin:$PATH"

# Fast fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Local environment overrides
[ -e $HOME/.env ] && . $HOME/.env
[ -e $HOME/.localenv ] && . $HOME/.localenv
