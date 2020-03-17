#!/bin/sh

r="git://github.com/bjjb/dotfiles"
d="${XDG_DATA_HOME:="$HOME/.local/share"}/dotfiles"
git clone -q --depth 1 --recurse-submodules "$r" "$d"
while IFS= read -r f; do ln -nsf "$d/$f" "$HOME/$f"; done < "$d/symlinks.txt"
