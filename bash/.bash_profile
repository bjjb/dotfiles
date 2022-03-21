[[ -f "$HOME/.profile" ]] && . "$HOME/.profile"
[[ -f "$HOME/.bashrc" ]]  && . "$HOME/.bashrc"

[[ -f "$HOME/.asdf/completions/asdf.bash" ]] && . "$HOME/.asdf/completions/asdf.bash"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
hash starship 2>/dev/null && . <(starship init bash)
hash gpg      2>/dev/null && export GPG_TTY="$(tty)"
hash aws      2>/dev/null && complete -C aws_completer aws
hash kubectl  2>/dev/null && . <(kubectl completion bash)
hash gopass   2>/dev/null && . <(gopass completion bash)

# vi:ft=bash
