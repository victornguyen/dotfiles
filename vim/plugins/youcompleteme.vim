" YouCompleteMe
" Code completion engine
" TODO: try a different one like https://github.com/ajh17/VimCompletesMe

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
