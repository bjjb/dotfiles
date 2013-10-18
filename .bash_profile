# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)
[ -r ~/.bashrc ] && . ~/.bashrc

# Source the other dotfiles...
d="$HOME/.dotfiles"
[ -r $d/aliases.bash ]     && . $d/aliases.bash
[ -r $d/completion.bash ]  && . $d/completion.bash
[ -r $d/prompt.bash ]      && . $d/prompt.bash
[ -r $d/todo.bash ]        && . $d/todo.bash
