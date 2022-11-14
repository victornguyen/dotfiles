local set = vim.opt

-- Line numbers
set.number = true
set.relativenumber = true

-- Tabs are spaces
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

-- Show whitespace
set.list = true
set.listchars = {tab = '▸·', trail = '·', nbsp = '·'}

-- Set :grep :lgrep to use rg
set.grepprg = 'rg --vimgrep --no-heading --smart-case'

-- Persistent undos
set.undofile = true

-- Open new splits to the right (vert) and bottom (hor)
set.splitright = true
set.splitbelow = true

-- Case-insensitive searches, except when an uppercase char is present
set.ignorecase = true
set.smartcase = true

-- Make `K` to open vim help for word under cursor
set.keywordprg = ':help'

-- Misc
set.cursorline = true
set.lazyredraw = true
set.scrolloff = 3
set.showmode = false -- it should hide --MODE-- in command bar?
set.signcolumn = 'yes'
set.termguicolors = true
