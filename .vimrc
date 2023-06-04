let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

set encoding=utf-8

call plug#begin()

Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'

call plug#end()

