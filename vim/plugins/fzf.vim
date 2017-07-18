" fzf
" Fuzzy find all the things
" TODO: tweak this config with use more of fzf's power
" TODO: checkout christoomey's fzf config for ideas

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'

" Disable colours because they don't work for me for some reason
let g:fzf_filemru_colors = {}

nnoremap <leader><tab> :FZF<CR>
nnoremap <leader>t :FZF<CR>
nnoremap <leader>p :ProjectMru<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>; :History:<CR>
