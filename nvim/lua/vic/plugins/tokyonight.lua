local status, tokyonight = pcall(require, 'tokyonight')
if not status then
  return
end

tokyonight.setup({
  style = 'night',
  dim_inactive = true,
})

vim.cmd([[colorscheme tokyonight]])
