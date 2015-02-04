" JJ's .vimrc
"
" All the useful stuff comes in bundles written by clever people - they're
" imported by pathogen (which is a submodule) here.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set tw=78 ts=2 sw=2 et
set visualbell

syntax on
set number
filetype plugin indent on


set laststatus=2 " always show a statusline

colorscheme molokai
set background=dark

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
let g:airline_left_sep = '║'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_right_sep = '║'
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" Command-mode editing
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>e <S-Right>

" I've found myself using the arrow keys! Need to stop!
:noremap <Up> <nop>
:noremap <Right> <nop>
:noremap <Down> <nop>
:noremap <Left> <nop>

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.litcoffee set sw=2
" vi:ft=vim
