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
	PATH="$prefix/bin:$PATH"
	# shellcheck source=/dev/null
	[ -f "$prefix/etc/bash_completion" ] && . "$prefix/etc/bash_completion"
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
	eval "$(ssh-agent)"
	command -v ssh-add > /dev/null && ssh-add
fi

# Add pasteboard-like commmands to platforms that need it and can supply it
if [ "$(uname)" != "Darwin" ] && command -v xclip > /dev/null
then # add clipboard functionality
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi
