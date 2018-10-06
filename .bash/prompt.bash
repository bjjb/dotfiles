# Sets up a colourful prompt with Git info
if [ "$(type -t __git_ps1)" = "function" ]; then
  grey="\[\033[0;37m\]"
  cyan="\[\033[1;36m\]"
  none="\[\033[0m\]"

  GIT_PS1_SHOWCOLORHINTS=1
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM="verbose name git"
  GIT_PS1_DESCRIBESTYLE=default

  PROMPT_COMMAND='__git_ps1 "$cyan\u$grey@\h:$cyan\w$none" "$grey\\\$$none "'
fi

f=/usr/local/share/bash_completion.sh
[ -f $f ] && source $f

# Also, start ssh-agent, if available (unless already started)
if [ -x $(which ssh-agent) ] && ! [ -e $SSH_AUTH_SOCK ]
then
  eval $(ssh-agent)
  ssh-add
  ssh-add ~/.ssh/bjjb.key
fi
