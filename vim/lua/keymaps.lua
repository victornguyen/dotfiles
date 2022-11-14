local keymap = vim.keymap.set

-- Quick escaping
keymap('i', 'jk', '<Esc>')

-- Fast access to command-line
keymap('n', ';', ':')

-- Make yank behave like everything else
keymap('n', 'Y', 'y$')

-- Cursor navigation
keymap({'n', 'v'}, '<C-h>', '^', {desc = 'Go to start of line'})
keymap({'n', 'v'}, '<C-l>', 'g_', {desc = 'Go to end of line'})

-- Search
keymap('n', 'n', 'nzzzv', {desc = 'Find next and center screen'})
keymap('n', 'N', 'Nzzzv', {desc = 'Find prev and center screen'})
keymap('v', '//', 'y/<c-r>"<cr>', {desc = 'Search for visually highlighted text'})
keymap('n', '<leader><space>', ':noh<cr>', {desc = 'Disable search highlighting until next search'})

-- Clipboard
keymap('n', 'gp', '`[v`]', {desc = 'Select pasted text'})
keymap('n', 'gP', '"+p', {desc = 'Paste from system clipboard'})

-- Delete buffer
keymap('n', '<leader>d', ':bd<cr>', {desc = 'Delete buffer'})

-- Join line and center screen
keymap('n', 'J', 'mzJ`z', {desc = 'Join line and center screen'})

-- Splits
keymap('n', '<c-w>v', ':vsp', {desc = 'Split vertically'})
keymap('n', '<c-w>x', ':sp', {desc = 'Split horizontally'})

-- Copy buffer path/name
keymap('n', '<leader>cf', ':let @+=expand("%")<CR>', {desc = "Copy buffer's relative file path"})
keymap('n', '<leader>cF', ':let @+=expand("%:p")<CR>', {desc = "Copy buffer's absolute file path"})
keymap('n', '<leader>ct', ':let @+=expand("%:t")<CR>', {desc = "Copy buffer's filename"})

-- Disable Ex mode because I don't know what it is yet
keymap('n', 'Q', '<Nop>')

-- Add relative movement > 5 lines to jumplist
-- TODO: find a way to do this here
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
