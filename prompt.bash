# LS coloring
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom prompt
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

function shortpath {
  #   How many characters of the $PWD should be kept
  local pwd_length=40
  local lpwd="${PWD/#$HOME/~}"
  if [ $(echo -n $lpwd | wc -c | tr -d " ") -gt $pwd_length ]; then
    newPWD="...$(echo -n $lpwd | sed -e "s/.*\(.\{$pwd_length\}\)/\1/")"
  else
    newPWD="$(echo -n $lpwd)"
  fi
  echo $newPWD
}

# PS1 prompt color vars
RED="\[\033[1;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
PURPLE="\[\033[1;35m\]"
BLUE="\[\033[0;34m\]"
TIME="[\t]"
DIRNAME="\w"

export PS1="$GREEN\u@\h:$PURPLE\$(shortpath)$RED\$(parse_git_branch)$YELLOW\$$WHITE "

[ -r /usr/share/git-core/git-prompt.sh ] && . /usr/share/git-core/git-prompt.sh
