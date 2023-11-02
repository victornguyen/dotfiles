return {
  'folke/tokyonight.nvim',
  config = function()
    require('tokyonight').setup({
      style = 'night',
      dim_inactive = true,
      on_colors = function(colors)
        colors.bg_dark = '#252632'
      end,
    })

    vim.cmd([[colorscheme tokyonight]])
  end,
}
