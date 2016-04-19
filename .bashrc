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

# Function definitions
rake ()   if [ -e bin/rake ]; then (bin/rake $*); else (`which rake` $*); fi
bundle () if [ -e bin/bundle ]; then (bin/bundle $*); else (`which bundle` $*); fi
rails ()  if [ -e bin/rails ]; then (bin/rails $*); else (`which rails` $*); fi

np () { mpc -f "%title% ¦ %artist% ¦ %album%"; }
mp () { mpc toggle; }

g () { git $*; }
d () { docker $*; }
dm () if [ $1 = "sw" ]; then eval $(docker-machine env $2); else docker-machine $*; fi

digitalocean () {
  curl -X GET                                             \
    -H "Content-Type: application/json"                   \
    -H "Authorization: Bearer $DIGITALOCEAN_ACCESS_TOKEN" \
    "https://api.digitalocean.com/v2/$1" | jsonpp;
}

# Anything potentially slow and non-essential in a non-interactive session
# should be loaded in .bash_profile instead.

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
