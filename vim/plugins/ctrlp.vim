" ctrlp
" Fuzzy finder
" TODO: remove ctrlp when comfy with fzf

Plug 'ctrlpvim/ctrlp.vim'

" Use ag over grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in ctrlp for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that ctrlp doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ignore source control dirs
" NOTE: this only applies when ag isn't available
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
