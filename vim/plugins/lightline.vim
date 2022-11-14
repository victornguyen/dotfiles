" lightline.vim
" Status bar replacement
" https://github.com/itchyny/lightline.vim

Plug 'itchyny/lightline.vim'

" Get full file path to display in status line
" https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline = {
    \   'colorscheme': 'tokyonight',
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
    \       [  ],
    \       [ 'cocstatus' ],
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
    \     'branch': 'FugitiveHead',
    \     'filename': 'LightlineFilename',
    \     'cocstatus': 'coc#status',
    \   },
    \ }
