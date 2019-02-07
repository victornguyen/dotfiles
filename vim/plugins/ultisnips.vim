" UltiSnips
" https://github.com/SirVer/ultisnips

" TODO: script these steps to enable installation of this...
" Download the packet and unpack into a directory of your choice. Then add this
" directory to your Vim runtime path by adding this line to your vimrc file. >
"    set runtimepath+=~/.vim/ultisnips_rep

" UltiSnips also needs Vim files from the ftdetect/ directory. Unfortunately,
" Vim only allows this directory in the .vim directory. You therefore have to
" symlink/copy the files: >
"    mkdir -p ~/.vim/ftdetect/
"    ln -s ~/.vim/ultisnips_rep/ftdetect/* ~/.vim/ftdetect/

Plug 'SirVer/ultisnips'

" Add UltiSnips to runtimepath
set runtimepath+=${HOME}/.vim/plugged/ultisnips

" It's meeeee
let g:snips_author = 'Victor Nguyen'

" Where my snippets live. I don't use third party snippets wholesale
" because I'd never learn them all. I'd rather move what I use into here
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/vim/UltiSnips']

" Edit snippets for the current file type
nnoremap <leader>us :UltiSnipsEdit<CR>

" Open snippet edit pane in split
let g:UltiSnipsEditSplit = 'vertical'
