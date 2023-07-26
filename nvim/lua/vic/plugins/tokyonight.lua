local status, tokyonight = pcall(require, 'tokyonight')
if not status then
  return
end

tokyonight.setup({
  style = 'night',
  dim_inactive = true,
  on_colors = function(colors)
    colors.bg_dark = '#252632'
  end,
})

vim.cmd([[colorscheme tokyonight]])
