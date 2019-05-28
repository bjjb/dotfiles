# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)

# shellcheck source=./.bashrc
[ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Hibernian English
export LC_ALL=en_IE.UTF-8

# The best editor
export EDITOR=vim
export VISUAL=$EDITOR

if [ -x /usr/bin/xclip ]
then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
