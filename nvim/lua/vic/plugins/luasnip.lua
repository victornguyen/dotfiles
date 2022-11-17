local status, luasnip = pcall(require, 'luasnip')
if (not status) then return end

-- Load friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Load custom snippets
require('luasnip.loaders.from_vscode').lazy_load({ paths = { '~/.config/nvim/snippets' } })

-- Enable markdown snippets in vimwiki files
luasnip.filetype_extend('vimwiki', { 'markdown' })
