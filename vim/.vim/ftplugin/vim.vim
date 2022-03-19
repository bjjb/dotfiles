" Settings for .vim files.
set foldmethod=marker
set sw=4
set nowrap
set number

augroup Vim
  autocmd!
  autocmd! BufWritePost .vimrc source %
augroup END
