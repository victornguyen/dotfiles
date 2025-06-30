return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/codecompanion-history.nvim',
  },
  config = function(_, opts)
    require('codecompanion').setup({
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = 'gH',
          },
        },
      },
    })
  end,
}
