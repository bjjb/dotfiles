# Loaded for interactive shells - sources ~/.bashrc and does some extra stuff
# that's not necessary for non-interactive shells (such as prompting)
[ -r ~/.bashrc ] && . ~/.bashrc
[ -e /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

cloud=Dropbox

if [ -d $HOME/$cloud ]; then
  d=$HOME/$cloud

  [ -f $d/TODO ] && cat $d/TODO
fi
