GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUPSTREAM="auto"

function ps1 {
  # Colors...
  local      off="\[\033[0m\]"
  # normal
  local    black="\[\033[0;30m\]"
  local      red="\[\033[0;31m\]"
  local    green="\[\033[0;32m\]"
  local   yellow="\[\033[0;33m\]"
  local     blue="\[\033[0;34m\]"
  local   purple="\[\033[0;35m\]"
  local     cyan="\[\033[0;36m\]"
  local    white="\[\033[0;37m\]"
  # bold
  local   bblack="\[\033[1;30m\]"
  local     bred="\[\033[1;31m\]"
  local   bgreen="\[\033[1;32m\]"
  local  byellow="\[\033[1;33m\]"
  local    bblue="\[\033[1;34m\]"
  local  bpurple="\[\033[1;35m\]"
  local    bcyan="\[\033[1;36m\]"
  local   bwhite="\[\033[1;37m\]"
  # intense
  local   iblack="\[\033[0;90m\]"
  local     ired="\[\033[0;91m\]"
  local   igreen="\[\033[0;92m\]"
  local  iyellow="\[\033[0;93m\]"
  local    iblue="\[\033[0;94m\]"
  local  ipurple="\[\033[0;95m\]"
  local    icyan="\[\033[0;96m\]"
  local   iwhite="\[\033[0;97m\]"
  # intense bold
  local  biblack="\[\033[1;90m\]"
  local    bired="\[\033[1;91m\]"
  local  bigreen="\[\033[1;92m\]"
  local biyellow="\[\033[1;93m\]"
  local   biblue="\[\033[1;94m\]"
  local bipurple="\[\033[1;95m\]"
  local   bicyan="\[\033[1;96m\]"
  local  biwhite="\[\033[1;97m\]"
  # underline
  local   ublack="\[\033[4;30m\]"
  local    ured="\[\033[4;31m\]"
  local   ugreen="\[\033[4;32m\]"
  local  uyellow="\[\033[4;33m\]"
  local    ublue="\[\033[4;34m\]"
  local  upurple="\[\033[4;35m\]"
  local    ucyan="\[\033[4;36m\]"
  local   uwhite="\[\033[4;37m\]"
  # background
  local   _black="\[\033[40m\]"
  local     _red="\[\033[41m\]"
  local   _green="\[\033[42m\]"
  local  _yellow="\[\033[43m\]"
  local    _blue="\[\033[44m\]"
  local  _purple="\[\033[45m\]"
  local    _cyan="\[\033[46m\]"
  local   _white="\[\033[47m\]"
  # intense backgrounds
  local  _iblack="\[\033[0;100m\]"
  local    _ired="\[\033[0;101m\]"
  local  _igreen="\[\033[0;102m\]"
  local _iyellow="\[\033[0;103m\]"
  local   _iblue="\[\033[0;104m\]"
  local _ipurple="\[\033[10;95m\]"
  local   _icyan="\[\033[0;106m\]"
  local  _iwhite="\[\033[0;107m\]"

  # Fancy characters
  local   arrow=$'\xe2\x86\x92'
  local mercury=$'\xe2\x98\xbf'

  local t="$iblack\t$off" # time
  local u="$cyan\u$off" # user
  local h="$cyan\h$off" # host
  local w="$yellow\w$off" # working directory
  local n="$iblack\#|\!$off" # history number of command
  local z="$iblack$arrow$off " # ->

  # 12:34:56 me@host:~/somepath
  local line1="$t $u$iblack@$off$h$iblack:$off$w" 
  # 20|522 -> 
  local line2="$n $z " 

  if type __git_ps1 >/dev/null 2>&1
  then
    # __git_ps1 (defined in git-completion.sh) actually sets PS1 if you pass
    # more than one argument to the function. We're passing a prefix, a suffix,
    # and a format for the gitstring.
    local format=" $iblack($off %s $iblack)$off"
    __git_ps1 "$line1" "\n$line2" "$format"
  else
    PS1="$line1\n$line2"
  fi
  PS2="$line2"
}

# Uses git-prompt.sh, prefixed with the time, suffixed with the $.
PROMPT_COMMAND='ps1'
