bjjb/dotfiles/vim
=================

A sane vim configuration.

Adding packages
---------------

While I don't like to rely too heavily on packages (after all, a properly
configured vanilla Vim 8 or NeoVim can do 90% of what most plugins do, and
faster), there are a few which I find truly indespensible. Rather than relying
on a plugin for plugin management, I like to use Vim 8's built-in package
management, and add the packages as submodules. So to add, for example, the
AndrewRadev/splitjoin.vim plugin, I'd run (from this directory)

    git submodule init
    git submodule add https://github.com/AndrewRadev/splitjoin.vim .vim/pack/bjjb/start/splitjoin.vim
