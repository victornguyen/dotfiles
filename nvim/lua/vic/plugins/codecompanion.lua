return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/codecompanion-history.nvim',
  },
  keys = {
    { '<leader>cc', ':CodeCompanionChat<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion Chat' },
    { '<leader>cp', ':CodeCompanionActions<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion Actions' },
  },
  config = function(_, opts)
    local use_copilot = os.getenv('USE_COPILOT') == 'true'

    local setup_config = {
      strategies = {
        chat = {
          adapter = use_copilot and 'copilot' or 'anthropic',
        },
        inline = {
          adapter = use_copilot and 'copilot' or 'anthropic',
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
    }

    -- Only configure Anthropic adapter when not using Copilot
    if not use_copilot then
      setup_config.adapters = {
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
      }
    end

    require('codecompanion').setup(setup_config)
  end,
}
