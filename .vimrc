" JJ's .vimrc
if !exists('g:loaded_matchit')
  runtime! macros/matchit.vim
endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
end

if has('gui_running')
  set guifont=Hack\ Regular:h14
  set guioptions=aemP
endif

" All the useful stuff comes in bundles written by clever people - they're
" imported by pathogen (which is a submodule) here.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

if has('autocmd')
  filetype plugin indent on
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufNewFile,BufRead *.litcoffee set sw=2
end

set tw=78 ts=2 sw=2 et
set visualbell
set backspace=indent,eol,start
syntax on
set number
set relativenumber
set cc=+1
set hlsearch incsearch
set backspace=indent,eol,start
set laststatus=2 " always show a statusline
set shell=/bin/bash
set display+=lastline
set smarttab
set wildmenu
set autoread
set ttimeout
set hidden
set ttimeoutlen=100
set complete-=i
set background=dark
colorscheme jellybeans

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Command-mode editing - behave like readline
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>e <S-Right>

" I've found myself using the arrow keys! Need to stop!
noremap <Up> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Left> <nop>

set exrc   " per-directory .vimrc files
set secure " to prevent abuse of 'exrc'

" Quick and dirty way to work with JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.litcoffee set sw=2

set modelines=2
set exrc   " per-directory .vimrc files
set secure " to prevent abuse of 'exrc'

" vi:ft=vim
