# Sourced by Bash login shells.

if [[ -f "$HOME/.bashrc" ]]
then
    . "$HOME/.bashrc"
fi

if [[ -f "$HOME/.profile" ]]
then
    . "$HOME/.profile"
fi

if [[ -f /usr/local/etc/bash_completion ]]
then
     . "/usr/local/etc/bash_completion"
fi

if [[ -f "$HOME/.asdf/asdf.sh" ]]
then
    . "$HOME/.asdf/asdf.sh"
fi

if [[ -f "$HOME/.asdf/completions/asdf.bash" ]]
then
    . "$HOME/.asdf/completions/asdf.bash"
fi

hash starship && . <(starship init bash)
