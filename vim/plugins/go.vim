" vim-go
" NOTE: Currently disabled in favour of using gopls with coc.nvim
" See if this works for you...
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Auto-format Go code and add missing imports on save.
" https://github.com/golang/tools/blob/master/gopls/doc/vim.md
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
