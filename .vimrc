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
  function! ConqueMan()
    let cmd = &keywordprg . ' '
    if cmd ==# 'man ' || cmd ==# 'man -s '
      if v:count > 0
        let cmd .= v:count . ' '
      else
        let cmd = 'man '
      endif
    endif
    let cmd .= expand('<cword>')
    execute 'ConqueTermSplit' cmd
  endfunction
  map K :<C-U>call ConqueMan()<CR>
  ounmap K
endif

runtime ftplugin/man.vim

" All the useful stuff comes in bundles written by clever people - they're
" installed as plugins in the .vim/pack directory.

if has('autocmd')
  filetype plugin indent on
  autocmd BufNewFile,BufRead *.json set ft=javascript
end

set shell=$SHELL
set textwidth=78 tabstop=2 shiftwidth=2 smarttab expandtab 
set backspace=indent,eol,start
set visualbell
set number
set signcolumn=yes
set cc=+1
set hlsearch incsearch
set backspace=indent,eol,start
set laststatus=2 " always show a statusline
set display+=lastline
set wildmenu
set autoread
set ttimeout
set hidden
set ttimeoutlen=100
" set background=dark

" set t_Co=256
colorscheme iceberg
" colorscheme dracula

" Airline (status-bar) config
" unicode symbols (require a suitable font, like Hack)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" let g:airline_theme = 'lucius'

" syntastic-airline plugin
let g:airline#extensions#syntastic#enabled = 1

" Don't allow Tmuxline to overwrite the theme
let g:airline#extensions#tmuxline#enabled = 0

" Command-mode editing - behave like readline
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>e <S-Right>

" vim-go settings
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_info_mode = 'guru'
let g:go_auto_type_indo = 1
let g:go_updatetime = 1000
let g:go_fmt_fail_silently = 1
let g:go_def_mode='gopls'
autocmd FileType go set noexpandtab
autocmd FileType go set shiftwidth=2
autocmd FileType go set softtabstop=2
autocmd FileType go set tabstop=2
autocmd FileType go set autowrite
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>T <Plug>(go-test-compile)
autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>f <Plug>(go-decls)
autocmd FileType go nmap <leader>F <Plug>(go-decls-dir)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:ale_kotlin_ktlint_executable = 'ktlint'

" I've found myself using the arrow keys! Need to stop!
noremap <Up> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Left> <nop>

" 2 x Esc to remove the search highlight
nnoremap <silent> <Esc><Esc> :noh<CR>

set exrc   " per-directory .vimrc files
set secure " to prevent abuse of 'exrc'

" Quick and dirty way to work with JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript

set autowrite
set modelines=2
set exrc   " per-directory .vimrc files
set secure " to prevent abuse of 'exrc'

" For editing crontabs
autocmd FileType crontab setlocal bkc=yes

" See ft-bash-syntax
let g:is_bash = 1

" Emmet config
let g:user_emmet_settings = { 'html' : { 'quote_char': "'" } }

" vi:ft=vim
