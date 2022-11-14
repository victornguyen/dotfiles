local map = require('vic.utils.keymap')

-- Quick escaping
map('i', 'jk', '<Esc>')

-- Fast access to command-line
map('n', ';', ':')

-- Make yank behave like everything else
map('n', 'Y', 'y$')

-- Cursor navigation
map({ 'n', 'v' }, '<C-h>', '^', { desc = 'Go to start of line' })
map({ 'n', 'v' }, '<C-l>', 'g_', { desc = 'Go to end of line' })

-- Search
map('n', 'n', 'nzzzv', { desc = 'Find next and center screen' })
map('n', 'N', 'Nzzzv', { desc = 'Find prev and center screen' })
map('v', '//', 'y/<C-r>"<CR>', { desc = 'Search for visually highlighted text' })
map('n', '<Leader><Space>', ':noh<CR>', { desc = 'Disable search highlighting until next search' })

-- Clipboard
map('n', 'gp', '`[v`]', { desc = 'Select pasted text' })
map('n', 'gP', '"+p', { desc = 'Paste from system clipboard' })

-- Delete buffer
map('n', '<leader>d', ':bd<CR>', { desc = 'Delete buffer' })

-- Join line and center screen
map('n', 'J', 'mzJ`z', { desc = 'Join line and center screen' })

-- Splits
map('n', '<C-w>v', ':vsp', { desc = 'Split vertically' })
map('n', '<C-w>x', ':sp', { desc = 'Split horizontally' })

-- Copy buffer path/name
map('n', '<Leader>cf', ':let @+=expand("%")<CR>', { desc = "Copy buffer's relative file path" })
map('n', '<Leader>cF', ':let @+=expand("%:p")<CR>', { desc = "Copy buffer's absolute file path" })
map('n', '<Leader>ct', ':let @+=expand("%:t")<CR>', { desc = "Copy buffer's filename" })

-- Disable Ex mode because I don't know what it is yet
map('n', 'Q', '<Nop>')

-- EasyAlign
map({ 'n', 'v' }, 'ga', '<Plug>(EasyAlign)')

-- Add relative movement > 5 lines to jumplist
-- TODO: find a way to do this here
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
