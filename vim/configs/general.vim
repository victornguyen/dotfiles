" General config

" Enable filetype-specific plugins/indentation
filetype plugin indent on

set cursorline      " highlight line cursor is on
set autoindent      " copy the indentation from the previous line
set scrolloff=3     " number of lines to always show at at the top & bottom
set hidden          " don't require saving when closing buffer
set visualbell      " no beeping
set autoread        " reload file when changed on disk

" Status bar
set showcmd         " show command in status bar
set laststatus=2    " always show a status bar
set ruler           " always show cursor position
set noshowmode      " hide --MODE-- in command bar

" Display relative line numbers
set number
set relativenumber

" Always show signcolumns
set signcolumn=yes

" Display extra whitespace chars
set list listchars=tab:»·,trail:·,nbsp:·

" Display available commands when autocompleting with <tab>
set wildmenu
set wildmode=longest:full,full
set completeopt-=preview

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Improve vim's scrolling speed
set ttyfast
set lazyredraw

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" Keep backups and swap files in central location
set directory=$HOME/.local/share/nvim/swap//
set backupdir=$HOME/.local/share/nvim/backup

" Set :grep and :lgrep to use rg
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Set cursor depending on active mode
:set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
