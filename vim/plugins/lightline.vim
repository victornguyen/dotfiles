" lightline.vim
" Status bar replacement
" https://github.com/itchyny/lightline.vim

Plug 'itchyny/lightline.vim'

let g:lightline = {
    \   'colorscheme': 'one',
    \   'active': {
    \     'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'branch' ],
    \       [ 'readonly', 'filename', 'modified' ],
    \     ],
    \     'right': [
    \       [ 'lineinfo' ],
    \       [  ],
    \       [ 'filetype' ],
    \     ],
    \   },
    \   'inactive': {
    \     'left': [
    \       [  ],
    \       [  ],
    \       [ 'readonly', 'filename' ],
    \     ],
    \     'right': [
    \       [ 'lineinfo' ],
    \       [  ],
    \       [ 'filetype' ],
    \     ],
    \   },
    \   'component_function': {
    \     'branch': 'fugitive#head'
    \   },
    \ }
