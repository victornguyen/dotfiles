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

" Map leader early on
lua vim.g.mapleader = ' '

" Source plugins
call plug#begin('~/.local/share/nvim/plugged')
call s:SourceConfigFilesIn('plugins')
call plug#end()

" Source config and keymaps
lua require('options')
lua require('keymaps')
lua require('themes')
