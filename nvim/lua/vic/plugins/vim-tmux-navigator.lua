vim.g.tmux_navigator_no_mappings = 1

local map = require('vic.utils.keymap')
local opts = { silent = true }

map('n', '<M-h>', ':TmuxNavigateLeft<cr>', opts)
map('n', '<M-j>', ':TmuxNavigateDown<cr>', opts)
map('n', '<M-k>', ':TmuxNavigateUp<cr>', opts)
map('n', '<M-l>', ':TmuxNavigateRight<cr>', opts)
map('n', '<M-p>', ':TmuxNavigatePrevious<cr>', opts)
