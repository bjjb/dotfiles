# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)
[ -r $HOME/.bashrc ] && . $HOME/.bashrc

# The best editor
export EDITOR=vim

# Source these extra scripts
for f in "functions" "homebrew" "prompt" "ruby" "perl" "go"
do
  [ -e "$HOME/.bash/$f.bash" ] && . "$HOME/.bash/$f.bash"
done
