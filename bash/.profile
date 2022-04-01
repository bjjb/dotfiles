# Sourced by POSIX shells

# Include ~/bin in the path
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
# Kill ssh-agent on exit (if it's running)
trap '[ -n "$SSH_AGENT_PID" ] && killall $SSH_AGENT_PID' EXIT
# Adds brew's openssl to the PKG_CONFIG_PATH (if brew is installed)
hash brew 2>/dev/null && export PKG_CONFIG_PATH=`brew --prefix`/opt/openssl/lib/pkgconfig
