local m = require('vic.utils')

-- Quick escaping
m.map('i', 'jk', '<Esc>')

-- Fast access to command-line
m.map('n', ';', ':')

-- Make yank behave like everything else
m.map('n', 'Y', 'y$')

-- Cursor navigation
m.map({ 'n', 'v' }, '<C-h>', '^', { desc = 'Go to start of line' })
m.map({ 'n', 'v' }, '<C-l>', 'g_', { desc = 'Go to end of line' })

-- Buffers
m.map('n', 'H', ':bp<CR>', { desc = 'Go to start of line' })
m.map('n', 'L', ':bn<CR>', { desc = 'Go to end of line' })
m.map('n', '<leader>d', ':bd<CR>', { desc = 'Delete buffer' })
m.map('n', '<leader>D', ':%bd|e#|bd#<CR>', { desc = 'Delete all buffers except current one' })

-- Search
m.map('n', 'n', 'nzzzv', { desc = 'Find next and center screen' })
m.map('n', 'N', 'Nzzzv', { desc = 'Find prev and center screen' })
m.map('v', '//', 'y/<C-r>"<CR>', { desc = 'Search for visually highlighted text' })
m.map('n', '<Leader><Space>', ':noh<CR>', { desc = 'Disable search highlighting until next search' })

-- Clipboard
m.map('n', 'gp', '`[v`]', { desc = 'Select pasted text' })
m.map('n', 'gP', '"+p', { desc = 'Paste from system clipboard' })

-- Join line and center screen
m.map('n', 'J', 'mzJ`z', { desc = 'Join line and center screen' })

-- Splits
m.map('n', '<C-w>v', ':vsp', { desc = 'Split vertically' })
m.map('n', '<C-w>x', ':sp', { desc = 'Split horizontally' })

-- Copy buffer path/name
m.map('n', '<Leader>cf', ':let @+=expand("%")<CR>', { desc = "Copy buffer's relative file path" })
m.map('n', '<Leader>cF', ':let @+=expand("%:p")<CR>', { desc = "Copy buffer's absolute file path" })
m.map('n', '<Leader>ct', ':let @+=expand("%:t")<CR>', { desc = "Copy buffer's filename" })

-- Disable Ex mode because I don't know what it is yet
m.map('n', 'Q', '<Nop>')

-- EasyAlign
m.map({ 'n', 'v' }, 'ga', '<Plug>(EasyAlign)')

-- Add relative movement > 5 lines to jumplist
-- TODO: find a way to do this here
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
