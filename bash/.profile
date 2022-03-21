# Sourced by POSIX shells
if [ -d "$HOME/bin" ]
then
    PATH="$PATH:$HOME/bin"
fi

trap '[ -n "$SSH_AUTH_SOCK" ] && killall ssh-agent' EXIT
