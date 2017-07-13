" Fix the sloooooow ruby syntax highlighting
" https://stackoverflow.com/a/38616348
augroup ft_rb
  au!
  au FileType ruby setlocal re=1 foldmethod=manual
augroup END
