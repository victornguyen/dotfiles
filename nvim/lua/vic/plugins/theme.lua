-- Stolen from:
-- https://github.com/Allaman/nvim/blob/da525aab338b79a6782792650da43cf67d7859dc/lua/core/plugins/theme.lua

local themes = {
  tokyonight = {
    'folke/tokyonight.nvim',
    branch = 'main',
    config = function()
      require('vic.plugins.themes.tokyonight')
    end,
  },
  catppuccin = {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('vic.plugins.themes.catppuccin')
    end,
  },
}

local selected_theme = themes[vim.g.config.theme.name]

return selected_theme
