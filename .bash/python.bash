if [ -x $(which pyenv) ]
then
  eval "$(pyenv init -)"
  pyenv shell aws-utils
fi
