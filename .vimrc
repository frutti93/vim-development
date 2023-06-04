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
set nu


call plug#begin()

Plug 'Valloric/YouCompleteMe'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'dense-analysis/ale'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'puremourning/vimspector'

call plug#end()


let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV

let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'