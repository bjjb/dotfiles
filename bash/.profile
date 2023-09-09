# Sourced by POSIX shells

# Language
export LANG=en_IE.UTF-8
# Default editor
export EDITOR=vim
# Include homebrew in the path, if it's available.
if [ "$(uname)" = "Darwin" ]
then
	[ -d "/opt/homebrew/bin" ] && PATH="/opt/homebrew/bin:$PATH"
	[ -d "/opt/homebrew/sbin" ] && PATH="/opt/homebrew/sbin:$PATH"
fi
# Include ~/bin in the path
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
# Kill ssh-agent on exit (if it's running)
trap '[ -n "$SSH_AGENT_PID" ] && killall $SSH_AGENT_PID' EXIT
# Adds brew's openssl to the PKG_CONFIG_PATH (if brew is installed)
hash brew 2>/dev/null && export PKG_CONFIG_PATH=`brew --prefix`/opt/openssl/lib/pkgconfig
