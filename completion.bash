# Bash
f=/usr/local/etc/bash_completion
[ -r $f ] && . $f

# Node, npm
if [ -r /usr/local/lib/node_modules/npm/lib/utils/completion.sh ] ; then
  . /usr/local/lib/node_modules/npm/lib/utils/completion.sh
fi
