local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

local map = require('vic.utils.keymap')
local opts = { silent = true }

map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>N', ':NvimTreeFindFile<CR>', opts)

nvim_tree.setup {
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = 's', action = '' } -- unbind it pls
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
