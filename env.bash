# Bash environment variables

# The editor - I am a vim person.
export EDITOR="$(which vim || which vi)"
export VISUAL=$EDITOR

# Prepend ~/bin
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH

# Use direnv, if installed
[ "$(which direnv)" != "" ] && eval "$(direnv hook bash)"

# Go (if installed)
if [ "$(which go)" != "" ] ; then
  export GOPATH=$HOME/go
  [ -d $GOPATH/bin ] && PATH=$PATH:$GOPATH/bin
fi

# Ruby (with chruby)
if [ -d /usr/local/share/chruby ] ; then
  . /usr/local/share/chruby/chruby.sh
  . /usr/local/share/chruby/auto.sh
fi
