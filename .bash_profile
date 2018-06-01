# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)
[ -r $HOME/.bashrc ] && . $HOME/.bashrc


# Source these extra scripts
for f in "functions" "homebrew" "prompt" "ruby" "perl" "go" "tmuxinator"
do
  [ -r "$HOME/.bash/$f.bash" ] && . "$HOME/.bash/$f.bash"
done

# Hibernian English
export LC_ALL=en_IE.UTF-8

# The best editor
export EDITOR=vim
