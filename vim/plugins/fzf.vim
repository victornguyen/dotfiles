" fzf
" Fuzzy find all the things
" TODO: tweak this config with use more of fzf's power
" TODO: checkout christoomey's fzf config for ideas

" Install system fzf
" Not sure how I feel about having this here, but vim-plug gives us
" an easy hook to run the post-clone install script, and it's suggested
" in the docs.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }

Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'

" Disable colours because they don't work for me for some reason
let g:fzf_filemru_colors = {}

nnoremap <leader><tab> :Files<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>p :ProjectMru<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>; :History:<CR>

" Enter ripgrep :Rg command for input
" Don't use :Rg<CR> because that will pull up a fzf list of every indexed
" line, effectively becoming a content _and_ filename search, which I
" do not want (most of the time)...
nnoremap <leader>rg :Rg<Space>

" Pass current word under cursor to :Rg and invoke
nnoremap <silent> <leader>rf :Rg <C-R><C-W><CR>
