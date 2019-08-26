" Emmet
" Expand abbreviations
" <C-e> to expand in insert mode

Plug 'mattn/emmet-vim'

" Enable emmet only in insert mode
let g:user_emmet_mode='i'

" Bind insert mode key for emmet expansion
imap <C-e> <plug>(emmet-expand-abbr)

" Thread about jsx expansion in js files:
" https://github.com/mattn/emmet-vim/issues/350
let g:user_emmet_settings = {
  \  'typescript' : {
  \      'extends' : 'jsx',
  \  },
  \  'javascript' : {
  \      'extends' : 'jsx',
  \  },
  \}
