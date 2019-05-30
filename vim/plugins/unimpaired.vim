" unimpaired.vim
" Pair mappings like ]q for :cnext, ]<space> for adding space below, etc
" [e and ]e to exchange the current line above or below it.
" TODO: learn more of these mappings

Plug 'tpope/vim-unimpaired'

" Disable [a and ]a binds
let g:nremap = {'[a': '', ']a': ''}
