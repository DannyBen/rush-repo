" Enable syntax highlighting
filetype plugin indent on
syntax on

" Add line numbers, wrapping, indentation
set number
set mouse=a
set nowrap
set tabstop=2 shiftwidth=2 expandtab

" q to quit
nnoremap q :q!<CR>

" Set some explicit syntax highlighting
augroup my_filetypes
  autocmd!
  autocmd BufReadPost COMMIT_EDITMSG set syntax=gitcommit
  autocmd BufRead,BufNewFile *.runfile set syntax=ruby
augroup END
