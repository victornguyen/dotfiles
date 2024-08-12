return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    filter_kind = false, -- see :help SymbolKind
  },
  keys = {
    { '<leader>at', '<cmd>AerialToggle!<cr>', desc = 'Toggle aerial window' },
    { '<leader>an', '<cmd>AerialNavToggle<cr>', desc = 'Toggle aerial nav window' },
  },
  config = function(_, opts)
    local m = require('vic.utils')

    opts.on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      m.map('n', '[a', '<cmd>AerialPrev<cr>', { buffer = bufnr, desc = 'Prev symbol' })
      m.map('n', ']a', '<cmd>AerialNext<cr>', { buffer = bufnr, desc = 'Next symbol' })
    end

    require('aerial').setup(opts)
  end,
}
