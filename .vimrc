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
set number
"set relativenumber
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

set t_Co=256
"colorscheme iceberg
colorscheme dracula
syntax on

" Airline (status-bar) config
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme = 'lucius'

" Don't allow Tmuxline to overwrite the theme
let g:airline#extensions#tmuxline#enabled = 0

" Command-mode editing - behave like readline
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>e <S-Right>

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>T  <Plug>(go-test-compile)
autocmd FileType go nmap <leader>l  <Plug>(go-metalinter)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

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

set autowrite
set modelines=2
set exrc   " per-directory .vimrc files
set secure " to prevent abuse of 'exrc'

" vi:ft=vim
