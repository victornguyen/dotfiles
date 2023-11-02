require('catppuccin').setup({
  flavour = vim.g.config.theme.catppuccin.variant,
  dim_inactive = {
    enabled = true,
    shade = 'dark',
    percentage = 0.15,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = {
      enabled = true
    },
    treesitter = true,
  }
})

vim.cmd.colorscheme 'catppuccin'
