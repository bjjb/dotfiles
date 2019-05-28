# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)

# shellcheck source=./.bashrc
[ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Hibernian English
export LC_ALL=en_IE.UTF-8

# The best editor
export EDITOR=vim
export VISUAL=$EDITOR

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [ -d "$HOME/.sdkman" ]
then
  export SDKMAN_DIR="$HOME/.sdkman"
  if [ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]
  then
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
  fi
fi
