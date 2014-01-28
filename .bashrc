# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

GOPATH=$HOME/go
PATH=$PATH:$HOME/go/bin

if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi
fi

# Local environment overrides
[ -e $HOME/.env ] && . $HOME/.env

# Anything potentially slow and non-essential for a non-interactive session
# should be loaded in .bash_profile instead.
