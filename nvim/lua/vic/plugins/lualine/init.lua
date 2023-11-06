return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine_ok, lualine = pcall(require, 'lualine')
    if not lualine_ok then
      vim.api.nvim_err_writeln('lualine not installed!')
      return
    end

    local components = require('vic.plugins.lualine.components')

    ---@diagnostic disable-next-line: undefined-field
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {
            'checkhealth',
            'mason',
            'NvimTree',
            'fugitiveblame',
          },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = '' } },
        },
        lualine_b = {
          {
            'filename',
            separator = { right = '' },
            color = {
              bg = '#292C3C',
              -- gui = 'bold',
            },
          },
        },
        lualine_c = {
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },
        lualine_x = {
          'searchcount',
          'filetype',
          components.lsp_clients,
          'branch',
        },
        lualine_y = { 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
