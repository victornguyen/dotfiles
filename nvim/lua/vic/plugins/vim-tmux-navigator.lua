vim.g.tmux_navigator_no_mappings = 1

local m = require('vic.utils')
local opts = { silent = true }

m.map('n', '<M-h>', ':TmuxNavigateLeft<cr>', opts)
m.map('n', '<M-j>', ':TmuxNavigateDown<cr>', opts)
m.map('n', '<M-k>', ':TmuxNavigateUp<cr>', opts)
m.map('n', '<M-l>', ':TmuxNavigateRight<cr>', opts)
m.map('n', '<M-p>', ':TmuxNavigatePrevious<cr>', opts)
