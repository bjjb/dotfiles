[ -d $HOME/.pyenv/bin ] && PATH=$PATH:$HOME/.pyenv/bin
if which pyenv > /dev/null
then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
