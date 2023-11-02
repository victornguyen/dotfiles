-- Show LSP status in lower-right corner
return {
  'j-hui/fidget.nvim',
  tag = 'legacy',
  config = function()
    require('fidget').setup()
  end,
}
