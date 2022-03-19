JJ's dot-files
==============

My standard Unixy dotfiles. Provides a fairly convenient [bash][] environment,
with a prompt by [starship][], programmery do-dads provided by [asdf][], a
[vim][] configuration, and sundry settings, completions, functions, and
whatnot. I use it to reasonable effect on FreeBSD, Ubuntu and MacOS.

Installation
------------

(You'll need [stow][].) After cloning the repo to somewhere permanent (I
recommend `$XDG_CONFIG_HOME/dotfiles` on most Unixes, or
`~/Library/Preferences/io.github.bjjb/dotfiles` on MacOS), cd into it.

Depending on your shell/editor/whatever preferences, run

    stow -t $HOME bash asdf vim x

That'll set up symlinks to config files for [Bash]

Caveats
-------

You're free to use and abuse anything you find here, but it comes with no
warranty whatsoever.

Have fun!

[bash]: https://www.gnu.org/software/bash/
[stow]: https://www.gnu.org/software/stow/
[vim]: https://vim.org
[asdf]: https://asdf-vm.com
[starship]: https://starship.rs
