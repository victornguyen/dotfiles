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
      adapters = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = 'ANTHROPIC_API_KEY',
            },
            schema = {
              model = {
                default = 'claude-sonnet-4-20250514',
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'anthropic',
        },
      },
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
