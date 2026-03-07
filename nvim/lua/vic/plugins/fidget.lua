-- Show LSP status in lower-right corner
return {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup()
  end,
}
