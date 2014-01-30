" JJ's .vimrc
"
" All the useful stuff comes in bundles written by clever people - they're
" imported by pathogen (which is a submodule) here.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set tw=78 ts=2 sw=2 et

syntax on
filetype plugin indent on

" vi:ft=vim
