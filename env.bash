# Bash environment variables

# The editor - I am a vim person.
export EDITOR=vim
export VISUAL=$EDITOR

# Prepend ~/bin
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH

# Use direnv, if installed
if command -v direnv >/dev/null 2>&1 ; then
  eval "$(direnv hook bash)"
fi

# Go (if installed)
if command -v go >/dev/null 2>&1 ; then
  export GOPATH=$HOME/go
  [ -d $GOPATH/bin ] && PATH=$PATH:$GOPATH/bin
fi

# Ruby (with chruby)
if [ -d /usr/local/share/chruby ] ; then
  . /usr/local/share/chruby/chruby.sh
  . /usr/local/share/chruby/auto.sh
fi
