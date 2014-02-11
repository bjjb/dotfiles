# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

if [ -d $HOME/bin ]; then
  PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/go ]; then
  export GOPATH=$HOME/go
  PATH=$PATH:$GOPATH/bin
fi

if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi
fi

# Local environment overrides
[ -e $HOME/.env ] && . $HOME/.env

# Locale settings
export LANG="en_US.UTF-8"

# Anything potentially slow and non-essential in a non-interactive session
# should be loaded in .bash_profile instead.

if [ -d /usr/local/heroku/bin ]; then
  PATH=$PATH:/usr/local/heroku/bin
fi
