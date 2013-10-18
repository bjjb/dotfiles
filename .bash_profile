# Loaded for interactive shells - it just ensures that .bashrc is sourced.
[ -r ~/.bashrc ] && . ~/.bashrc

# Use direnv, if available
[ -x /usr/local/bin/direnv ] && eval "$(direnv hook bash)"
