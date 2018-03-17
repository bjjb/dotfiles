# Loaded automatically for non-login shells, and sourced by .bash_profile for
# login shells.
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

# Locale settings
export LANG="en_IE.UTF-8"

# Local Go installation
export GOPATH="$HOME"

# Local environment overrides
[ -e $HOME/.env ]       && . $HOME/.env
[ -e $HOME/.env.local ] && . $HOME/.env.local
[ -e $HOME/.localenv ]  && . $HOME/.localenv
