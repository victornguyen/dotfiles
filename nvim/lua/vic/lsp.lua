local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
  return
end

local format_ok, lspformat = pcall(require, 'lsp-format')
if not format_ok then
  return
end

local m = require('vic.utils')

local opts = { silent = true }
m.map('n', '<space>e', vim.diagnostic.open_float, opts)
m.map('n', '[d', vim.diagnostic.goto_prev, opts)
m.map('n', ']d', vim.diagnostic.goto_next, opts)
m.map('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Format on save
  lspformat.on_attach(client)

  -- Keymaps
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent = true, buffer = bufnr }
  m.map('n', 'gd', vim.lsp.buf.definition, bufopts)
  m.map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  m.map('n', 'gy', vim.lsp.buf.type_definition, bufopts)
  m.map('n', 'gr', vim.lsp.buf.references, bufopts)
  m.map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  m.map('n', 'K', vim.lsp.buf.hover, bufopts)
  m.map('n', '<Space>rn', vim.lsp.buf.rename, bufopts)

  -- TODO: try the functions from:
  -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
  m.map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

-- local protocol = require('vim.lsp.protocol')

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'sumneko_lua',
    'tsserver',
    'jsonls',
    'astro',
  },
  automatic_installation = true,
})

-- Lua
lspconfig.sumneko_lua.setup({
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Accepted globals
        globals = { 'vim', 'hs' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- TypeScript
lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  cmd = { 'typescript-language-server', '--stdio' },
})

-- JSON
lspconfig.jsonls.setup({
  on_attach = on_attach,
})

-- Astro
lspconfig.astro.setup({
  on_attach = on_attach,
})
