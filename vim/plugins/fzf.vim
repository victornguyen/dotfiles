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

nnoremap <leader>f :Files<CR>
nnoremap <silent> <leader>p :ProjectMru<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>; :History:<CR>
nnoremap <leader>a :Buffers<CR>
nnoremap <leader>l :BLines<CR>

" Enter ripgrep command
" Don't use :Rg<CR> because that will pull up a fzf list of every indexed
" line, effectively becoming a content _and_ filename search, which I
" do not want (most of the time)...
nnoremap <leader>rg :Rg<Space>

" Pass current word under cursor to :Rg and invoke
nnoremap <silent> <leader>rf :Rg <C-R><C-W><CR>

" Make :Snippets search for snippet description
" https://www.reddit.com/r/vim/comments/ajbs68/fzf_snippets_ultisnips_match_word_in_description/eewip71
command! -bar -bang Snippets call fzf#vim#snippets({'options': '-n ..'}, <bang>0)

" Hide statusline and line numbers when fzf is invoked in terminal buffer
" https://github.com/junegunn/fzf/blob/master/README-VIM.md#hide-statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
