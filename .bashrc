# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

if [ -d $HOME/bin ]; then
  PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/go ]; then
  export GOPATH=$HOME/go
  GOROOT=`go env GOROOT`
  PATH=$PATH:$GOROOT/bin:$GOPATH/bin
elif [ -d $HOME/code/go ]; then
  export GOPATH=$HOME/code/go
  GOROOT=`go env GOROOT`
  PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi
fi

# Locale settings
export LANG="en_US.UTF-8"

if [ -d /usr/local/heroku/bin ]; then
  PATH=$PATH:/usr/local/heroku/bin
fi

# Local environment overrides
[ -e $HOME/.env ] && . $HOME/.env

# Anything potentially slow and non-essential in a non-interactive session
# should be loaded in .bash_profile instead.
