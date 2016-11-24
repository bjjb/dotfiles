# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d /usr/local/sbin ] && export PATH=/usr/local/sbin:$PATH

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

# Local perl installation
if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
  source $HOME/perl5/perlbrew/etc/bashrc
fi

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Local environment overrides
[ -e $HOME/.env ] && . $HOME/.env
