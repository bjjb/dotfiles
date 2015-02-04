# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH

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

# Perlbrew
if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# Locale settings
export LANG="en_US.UTF-8"

if [ -d /usr/local/heroku/bin ]; then
  PATH=$PATH:/usr/local/heroku/bin
fi

# Local perl installation
if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
  source $HOME/perl5/perlbrew/etc/bashrc
fi

# Local environment overrides
[ -e $HOME/.env ] && . $HOME/.env

function rake {
  if [ -e bin/rake ]; then (bin/rake $*); else (`which rake` $*); fi
}
function bundle {
  if [ -e bin/bundle ]; then (bin/bundle $*); else (`which bundle` $*); fi
}
function rails {
  if [ -e bin/rails ]; then (bin/rails $*); else (`which rails` $*); fi
}

# Anything potentially slow and non-essential in a non-interactive session
# should be loaded in .bash_profile instead.

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi
