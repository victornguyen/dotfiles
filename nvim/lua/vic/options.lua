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
set.listchars = { tab = '▸·', trail = '·', nbsp = '·' }

-- Set :grep :lgrep to use rg
set.grepprg = 'rg --vimgrep --no-heading --smart-case'

-- Persistent undos
set.undofile = true

-- Disable swap files (they're annoying and I'm an over-saver anyway)
set.swapfile = false

-- Open new splits to the right (vert) and bottom (hor)
set.splitright = true
set.splitbelow = true

-- Case-insensitive searches, except when an uppercase char is present
set.ignorecase = true
set.smartcase = true

-- Make `K` to open vim help for word under cursor
-- TODO: can this work in lua nvim configs?
set.keywordprg = ':help'

-- Misc
set.cursorline = true
set.scrolloff = 3
set.showmode = false -- it should hide --MODE-- in command bar?
set.signcolumn = 'yes'
set.termguicolors = true
set.updatetime = 250 -- Faster completion and diagnostics

-- NOTE: The block below fixes cursor blinking when nvim is inside tmux.
-- However the block cursor does not invert the character it's on -- can't see.
-- Let's disable this for now and maybe revisit later. We only lose blinking in
-- nvim when inside tmux. Cursor shape/blink/invert is correct everywhere else.
--
-- Taken straight from :h guicursor
-- vim.cmd [[
--   :set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--     \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--     \,sm:block-blinkwait175-blinkoff150-blinkon175
-- ]]
