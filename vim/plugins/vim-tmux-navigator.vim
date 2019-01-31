" Vim Tmux Navigator
" Navigate between vim splits and tmux panes with the same bindings

Plug 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1

" Map <alt+hjklp> for split/pane navigation
nnoremap <silent> <Esc>h :TmuxNavigateLeft<cr>
nnoremap <silent> <Esc>j :TmuxNavigateDown<cr>
nnoremap <silent> <Esc>k :TmuxNavigateUp<cr>
nnoremap <silent> <Esc>l :TmuxNavigateRight<cr>
nnoremap <silent> <Esc>p :TmuxNavigatePrevious<cr>
