" Emmet
" Expand abbreviations
" <C-y>, to expand
" TODO: change leader key to <tab>? See if that conflicts with new
" autocomplete solution.

Plug 'mattn/emmet-vim'

" Thread about jsx expansion in js files:
" https://github.com/mattn/emmet-vim/issues/350
let g:user_emmet_settings = {
  \  'javascript' : {
  \      'extends' : 'jsx',
  \  },
  \}
