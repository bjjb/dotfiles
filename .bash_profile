# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)
[ -r $HOME/.bashrc ] && . $HOME/.bashrc

# Source these extra scripts
[ -d $HOME/.bash ] && for f in $HOME/.bash/*.bash; do . $f; done

[ -w pyenv ] && eval "$(pyenv init -)"

# Hibernian English
export LC_ALL=en_IE.UTF-8

# The best editor
export EDITOR=vim
export VISUAL=$EDITOR
