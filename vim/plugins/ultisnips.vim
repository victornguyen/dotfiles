" UltiSnips
" https://github.com/SirVer/ultisnips

" TODO: really need this? seems to be recognising .snippets already
" UltiSnips also needs Vim files from the ftdetect/ directory. Unfortunately,
" Vim only allows this directory in the .vim directory. You therefore have to
" symlink/copy the files: >
"    mkdir -p ~/.vim/ftdetect/
"    ln -s ~/.vim/ultisnips_rep/ftdetect/* ~/.vim/ftdetect/

Plug 'SirVer/ultisnips'

" Re-map snippet expansion key to reserve <tab> for coc
let g:UltiSnipsExpandTrigger="<C-space>"

" Add UltiSnips to runtimepath
set runtimepath+=${HOME}/.local/share/nvim/plugged/ultisnips

" It's meeeee
let g:snips_author = 'Victor Nguyen'

" Where my snippets live. I don't use third party snippets wholesale
" because I'd never learn them all. I'd rather move what I use into here
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/vim/UltiSnips']

" Edit snippets for the current file type
nnoremap <leader>us :UltiSnipsEdit<CR>

" Open snippet edit pane in split
let g:UltiSnipsEditSplit = 'vertical'
