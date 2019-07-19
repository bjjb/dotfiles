# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.

# Checks whether the PATH variable ($2 or $PATH) contains $1.
path_has() {
  path="${2:-$PATH}"
  [ "$path" == "$1" ]      && return 0  # $path and $1 are identical
  [ -z "${path##*:$1:*}" ] && return 0  # $1 contained within $path
  [ -z "${path##*$1:*}" ]  && return 0  # $1 found at the start of $path
  [ -z "${path##:$1*}" ]   && return 0  # $1 found at the end of $path
  return 1;                             # $1 not found in $path
}

# Standard PATH entries...
for p in /usr/local/bin /usr/local/sbin $HOME/bin
do
  path_has "$p" || PATH="$p:$PATH"
done

# Hibernian English
export LC_ALL=en_IE.UTF-8

# The best editor
export EDITOR=vim
export VISUAL=$EDITOR

# Workaround for
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=877582
export QUOTING_STYLE=literal

# Local environment overrides
for envfile in ".env" ".env.local" ".localenv"
do
  # shellcheck source=/dev/null
  [ -e "$HOME/$envfile" ] && . "$HOME/$envfile"
done

# Source these extra scripts
if [ -d "$HOME/.bash" ]
then
  for script in $HOME/.bash/*.bash
  do
    # shellcheck source=/dev/null
    . "$script"
  done
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
