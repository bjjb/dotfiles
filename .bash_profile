# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)
[ -r ~/.bashrc ] && . ~/.bashrc

platform=$(uname)

# Homebrew setup (Darwin only)
if [ $platform = "Darwin" ]; then
  which -s brew # check whether homebrew is available
  if [ $? = 0 ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
  fi
fi

clouddir=Dropbox

# Showing this early, to be read while other things are happening
[ -f $HOME/$clouddir/TODO ] && cat $HOME/$clouddir/TODO

if [ "$(type -t __git_ps1)" = "function" ]; then
  grey="\[\033[1;30m\]"
  light_grey="\[\033[0;37m\]"
  cyan="\[\033[0;36m\]"
  light_cyan="\[\033[1;36m\]"
  no_colour="\[\033[0m\]"

  GIT_PS1_SHOWCOLORHINTS=1
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM="verbose name git"
  GIT_PS1_DESCRIBESTYLE=default

  PROMPT_COMMAND='__git_ps1 "$light_cyan\u$light_grey@\h:$cyan\w$no_colour" "$light_grey\\\$$no_colour "'
fi

export EDITOR=vim

[ -e ~/.bash/functions.bash ] && . ~/.bash/functions.bash
