" Vim Tmux Navigator
" Navigate between vim splits and tmux panes with the same bindings

Plug 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1

" Map <alt+hjklp> for split/pane navigation
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-p> :TmuxNavigatePrevious<cr>
