#!/bin/sh

repo=git://github.com/bjjb/dotfiles
dir="${XDG_DATA_HOME:="$HOME/.local/share"}/dotfiles"
# git clone -q --depth 1 --recurse-submodules "$repo" "$dir"
while IFS= read -r f; do ln -nsf "$dir/$f" "$HOME/$f"; done < symlinks.txt
