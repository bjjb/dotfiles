# Homebrew setup (Darwin only)
if [ "$(uname)" = "Darwin" ]; then
  which -s brew # check whether homebrew is available
  if [ $? = 0 ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
  fi
fi
