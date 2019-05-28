if [ -d "$HOME/.pyenv/bin" ]
then
  echo "Setting up pyenv"
  PATH="$PATH:$HOME/.pyenv/bin"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
