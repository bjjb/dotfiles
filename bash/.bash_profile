[[ -f "$HOME/.profile" ]] && . "$HOME/.profile"
[[ -f "$HOME/.bashrc" ]]  && . "$HOME/.bashrc"

[[ -f "$HOME/.asdf/completions/asdf.bash" ]] && . "$HOME/.asdf/completions/asdf.bash"

hash brew     && . <(cat "$(brew --prefix)/etc/bash_completion.d/"*)
hash starship && . <(starship init bash)
hash gpg      && export GPG_TTY="$(tty)"
hash aws      && complete -C aws_completer aws
hash kubectl  && . <(kubectl completion bash)

# vi:ft=bash
