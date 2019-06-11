" Signify
" Add signs for buffer vcs status to gutter
" ]c and [c to navigate hunks

Plug 'mhinz/vim-signify'

" Improve performance by only defining VCS that I actually use
let g:signify_vcs_list = ['git']

" Set changed symbol
let g:signify_sign_change = '~'

" Be more aggressive in keeping the signs up-to-date
let g:signify_realtime = 1
