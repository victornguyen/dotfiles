local m = require('vic.utils')

m.map('n', '<leader>gb', ':Git blame<cr>')
m.map('n', '<leader>gd', ':Gitdiffsplit<cr>')
m.map('n', '<leader>gS', ':Git<cr>')
m.map('n', '<leader>G', ':Git status<cr>')
m.map('n', '<leader>gl', ':0Gclog<cr>')
m.map('n', '<leader>go', ':GBrowse<cr>')