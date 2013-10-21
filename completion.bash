# Bash
if [ -r /usr/local/etc/bash_completion ]
then
  . /usr/local/etc/bash_completion
fi

# Node, npm
if [ -r /usr/local/lib/node_modules/npm/lib/utils/completion.sh ]
then
  . /usr/local/lib/node_modules/npm/lib/utils/completion.sh
fi

# Rubygems
if [ -r $HOME/.dotfiles/rubygems-completion.bash ]
then
  . $HOME/.dotfiles/rubygems-completion.bash
fi
