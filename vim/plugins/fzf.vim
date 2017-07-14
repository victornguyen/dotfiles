" fzf
" Fuzzy find all the things
" TODO: tweak this config with use more of fzf's power
" TODO: checkout christoomey's fzf config for ideas

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

nnoremap <leader><tab> :FZF<CR>
nnoremap <leader>t :FZF<CR>
nnoremap <leader>p :FZFMru<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>: :History:<CR>
