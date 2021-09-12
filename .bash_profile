# Loaded for interactive shells.

# Hibernian English
export LC_ALL=en_IE.UTF-8

# The best editor
export EDITOR=vim
export VISUAL=$EDITOR

# Easier Go use
export GOPATH="$HOME"

if [ "$(uname)" = "Darwin" ] && command -v brew > /dev/null
then
	prefix="$(brew --prefix)"
	PATH="$prefix/sbin:$prefix/bin:$PATH"
	# shellcheck source=/dev/null
	if [ -f "$prefix/etc/bash_completion" ]
	then
		. "$prefix/etc/bash_completion"
	fi
fi

if [ -d /usr/local/opt/openjdk/bin ]
then
	PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

# Workaround for
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=877582
export QUOTING_STYLE=literal

# asdf setup
if [ -e "$HOME/.asdf" ]
then # Load asdf (https://asdf-vm.com)
	# shellcheck source=/dev/null
	. "$HOME/.asdf/asdf.sh"
	# shellcheck source=/dev/null
	. "$HOME/.asdf/completions/asdf.bash"
fi

# Load starship (https://starship.rs)
command -v starship > /dev/null && eval "$(starship init bash)"

# Load fzf (https://github.com/junegunn/fzf)
# shellcheck source=/dev/null
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

# Set up an SSH agent, and add standard identities
if [ "$SSH_AGENT_PID" = "" ] && command -v ssh-agent > /dev/null
then
	eval "$(ssh-agent)" > /dev/null
	command -v ssh-add > /dev/null && ssh-add -q
fi

# Add pasteboard-like commmands to platforms that need it and can supply it
if [ "$(uname)" != "Darwin" ] && command -v xclip > /dev/null
then # add clipboard functionality
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi

[ -d "$HOME/bin" ] && PATH=$HOME/bin:$PATH
[ -d "$HOME/sbin" ] && PATH=$HOME/sbin:$PATH

# shellcheck disable=SC1091
[ -e "$HOME/.env" ] && . "$HOME/.env"

# shellcheck disable=SC1091
[ -e "$HOME/.env.local" ] && . "$HOME/.env.local"

GPG_TTY="$(tty)"
export GPG_TTY
