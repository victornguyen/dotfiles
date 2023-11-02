require('tokyonight').setup({
  style = vim.g.config.theme.tokyonight.variant,
  dim_inactive = true,
  on_colors = function(colors)
    colors.bg_dark = '#252632'
  end,
})

vim.cmd.colorscheme 'tokyonight'
