return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    local status = pcall(require, 'luasnip')
    if not status then
      return
    end

    -- Load friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
