# Bash
f=/usr/local/etc/bash_completion
[ -r $f ] && . $f

# Node, npm
if [ "$(which node)" != "" ] ; then
  f="$(node -e 'console.log(process.config.variables.node_prefix)')/lib/node_modules/npm/lib/utils/completion.sh"
  [ -r $f ] && . $f
fi

# Clean up
f=
