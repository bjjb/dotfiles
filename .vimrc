" JJ's .vimrc
"
" All the useful stuff comes in bundles written by clever people - they're
" imported by pathogen (which is a submodule) here.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set tw=78 ts=2 sw=2 et
set visualbell
set backspace=indent,eol,start

syntax on
set number
filetype plugin indent on

set laststatus=2 " always show a statusline

set background=dark

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" "let g:airline_left_sep = '»'
" "let g:airline_left_sep = '▶'
" let g:airline_left_sep = '║'
" "let g:airline_right_sep = '«'
" "let g:airline_right_sep = '◀'
" let g:airline_right_sep = '║'
" "let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" "let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" "let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts=1

" Command-mode editing - behave like readline
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

" Quick and dirty way to work with JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.litcoffee set sw=2

set exrc   " per-directory .vimrc files
set secure " to prevent abuse of 'exrc'

" vi:ft=vim
