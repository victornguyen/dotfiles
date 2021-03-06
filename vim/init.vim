" Stolen wholesale from christoomey:
" https://github.com/christoomey/dotfiles/blob/master/vim/vimrc
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

" Disable Vi compatibility
set nocompatible

" Map leader before other keymaps
let mapleader = "\<Space>"

" Source plugins
call plug#begin('~/.local/share/nvim/plugged')
call s:SourceConfigFilesIn('plugins')
call plug#end()

" Source configs
call s:SourceConfigFilesIn('configs')
