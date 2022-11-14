local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local map = require('vic.utils.keymap')

local opts = { silent = true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('Format', { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    })
  end

  -- Keymaps
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent = true, buffer = bufnr }
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gy', vim.lsp.buf.type_definition, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<Space>rn', vim.lsp.buf.rename, bufopts)

  -- TODO: try the functions from:
  -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
  map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

-- local protocol = require('vim.lsp.protocol')

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'sumneko_lua',
    'tsserver',
    'jsonls',
  },
  automatic_installation = true
})

-- Lua
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      -- Use the language server's code formatter
      -- Options: https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
      format = {
        enable = true,
        defaultConfig = {
          quote_style = 'single',
          indent_style = 'space',
          indent_size = '2',
          continuous_assign_statement_align_to_equal_sign = 'false',
          continuous_assign_table_field_align_to_equal_sign = 'false',
          align_table_field_to_first_field = 'false'
        }
      }
    },
  },
}

-- TypeScript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  },
  cmd = { 'typescript-language-server', '--stdio' }
}

-- JSON
lspconfig.jsonls.setup {}
