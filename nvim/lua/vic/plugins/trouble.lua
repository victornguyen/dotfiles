return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    modes = {
      -- Enhanced diagnostics mode with preview
      diagnostics = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
        format = "{severity_icon} {filename} {pos} {item.message}",
        groups = {
          { "filename", format = "{file_icon} {basename:Title} {count}" },
        },
      },
      -- Buffer-specific diagnostics
      buffer_diagnostics = {
        mode = "diagnostics",
        filter = { buf = 0 },
        preview = {
          type = "split",
          relative = "win", 
          position = "right",
          size = 0.3,
        },
      },
    },
  },
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble buffer_diagnostics toggle<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xt',
      '<cmd>Trouble todo toggle filter.buf=0<cr>',
      desc = 'TODO List Buffer (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
