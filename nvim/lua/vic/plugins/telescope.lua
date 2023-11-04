-- ' exact match (not fuzzy)
-- | OR operator
-- ^ starts with
-- $ ends with
-- ! inverse match

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local m = require('vic.utils')

    m.map('n', '<leader>ff', builtin.find_files, { desc = 'Lists files in cwd' })
    m.map('n', '<leader>p', builtin.buffers, { desc = 'Lists open buffers' })

    m.map('n', '<leader>rg', builtin.live_grep, { desc = 'Search for string in cwd' })
    m.map('n', '<leader>rf', builtin.grep_string, { desc = 'Searches for string under cursor' })

    m.map('n', '<leader>fl', builtin.current_buffer_fuzzy_find, { desc = 'Search in current buffer' })
    m.map(
      'n',
      '<leader>fa',
      ":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>",
      { desc = 'Search in all buffers' }
    )

    m.map('n', '<leader>fs', builtin.git_status, { desc = 'Lists current changes' })
    m.map('n', '<leader>fc', builtin.git_bcommits, { desc = 'Lists current buffer\'s commits' })

    m.map('n', '<leader>fh', builtin.help_tags, { desc = 'Lists available help tags' })
    m.map('n', '<leader>fk', builtin.keymaps, { desc = 'Lists normal mode keymaps' })
    m.map('n', '<leader>;', builtin.command_history, { desc = 'Lists recently executed commands' })
    m.map('n', '<leader>/', builtin.search_history, { desc = 'Lists recent search terms' })

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<c-c>'] = actions.close,
            ['<c-j>'] = actions.move_selection_next,
            ['<c-k>'] = actions.move_selection_previous,
            ['<c-s>'] = actions.cycle_previewers_next,
            ['<c-a>'] = actions.cycle_previewers_prev,
            ['<c-space>'] = actions.to_fuzzy_refine,
            ['<c-l>'] = actions.send_to_qflist + actions.open_qflist,
            ['<c-o>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ['<c-c>'] = actions.close,
          }
        },
      },
      pickers = {
        buffers = {
          layout_strategy = 'vertical',
          layout_config = {
            prompt_position = 'bottom',
            height = 0.4,
            width = 0.6,
          },
          path_display = { smart = true },
          previewer = false,
        },
        git_status = {
          layout_strategy = 'vertical',
          layout_config = {
            height = 0.7,
            preview_height = 0.55,
          },
        }
      }
    })

    telescope.load_extension('fzf')
  end,
}
