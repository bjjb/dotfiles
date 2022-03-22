# Sourced by POSIX shells
if [ -d "$HOME/bin" ]
then
    PATH="$PATH:$HOME/bin"
fi

trap '[ -n "$SSH_AGENT_PID" ] && killall $SSH_AGENT_PID' EXIT
