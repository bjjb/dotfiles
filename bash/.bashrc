# Sourced by all Bash shells
dotfiles() {
	dirname "$(dirname "$(realpath "$(readlink -fn "${BASH_SOURCE[0]}")")")"
}

[[ -f "$HOME/.asdf/asdf.sh" ]] && . "$HOME/.asdf/asdf.sh"

update-dotfiles() {
	make -C "$(dotfiles)"
}

[ -d $HOME/.local/lib/webos/bin ] && PATH=$PATH:$HOME/.local/lib/webos/bin
