local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local map = require('vic.utils.keymap')

map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fp', builtin.buffers)

map('n', '<leader>rg', builtin.live_grep)
map('n', '<leader>rf', builtin.grep_string)

-- TODO: not working atm -> https://github.com/nvim-telescope/telescope.nvim/issues/2192
map('n', '<leader>fl', builtin.current_buffer_fuzzy_find)

map('n', '<leader>fs', builtin.git_status)
map('n', '<leader>fc', builtin.git_bcommits)

map('n', '<leader>fh', builtin.help_tags)
map('n', '<leader>fk', builtin.keymaps)
map('n', '<leader>;', builtin.command_history)
map('n', '<leader>/', builtin.search_history)

-- TODO: learn how to send selections to quickfix list

-- TODO: configure individual pickers to better suite their purpose to and help me distinguish them
-- TODO: add better symbols for git_status picker

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<c-j>'] = actions.move_selection_next,
        ['<c-k>'] = actions.move_selection_previous,
      }
    },
  }
}

-- ' exact match (not fuzzy)
-- | OR operator
-- ^ starts with
-- $ ends with
-- ! inverse match
require('telescope').load_extension('fzf')
