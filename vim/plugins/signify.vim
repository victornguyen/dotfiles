" Signify
" Add signs for buffer vcs status to gutter
" ]c and [c to navigate hunks

Plug 'mhinz/vim-signify'

" Improve performance by only defining VCS that I actually use
let g:signify_vcs_list = ['git']

" TODO: set g:signify_realtime to enable checks on BufEnter?
