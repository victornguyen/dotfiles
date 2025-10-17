local neodev_ok, neodev = pcall(require, 'neodev')
if neodev_ok then
  neodev.setup({})
end

local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
  return
end

local m = require('vic.utils')

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_capabilities_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = 'if_many',
    spacing = 2,
    -- Limit virtual text length to prevent overwhelming truncation
    format = function(diagnostic)
      local message = diagnostic.message
      -- Truncate long messages but keep them readable
      if #message > 80 then
        return message:sub(1, 77) .. '...'
      end
      return message
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
    -- Improve float window sizing
    max_width = 120,
    max_height = 20,
    wrap = true,
    -- Add focus to float window
    focus = false,
    -- Show diagnostic in a nice format
    format = function(diagnostic)
      local code = diagnostic.code and string.format(' [%s]', diagnostic.code) or ''
      local source = diagnostic.source and string.format(' (%s)', diagnostic.source) or ''
      return string.format('%s%s%s', diagnostic.message, code, source)
    end,
  },
})

local opts = { silent = true }
-- Enhanced diagnostic float with AI explanation option
m.map('n', '<space>e', function()
  vim.diagnostic.open_float({
    border = 'rounded',
    source = 'always',
    header = 'Diagnostic (Press <C-e> to explain with AI)',
    prefix = '',
    max_width = 120,
    max_height = 20,
    wrap = true,
    focus = true, -- Allow focus for keymap
    format = function(diagnostic)
      local code = diagnostic.code and string.format(' [%s]', diagnostic.code) or ''
      local source = diagnostic.source and string.format(' (%s)', diagnostic.source) or ''
      return string.format('%s%s%s', diagnostic.message, code, source)
    end,
  })

  -- Add keymap for AI explanation when float is open
  vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<C-e>',
    '<cmd>lua require("vic.utils").explain_diagnostic()<CR>',
    { noremap = true, silent = true }
  )
end, opts)
-- TODO: decide between these and lspsaga ones
-- m.map('n', '[d', function()
--   vim.diagnostic.jump({ count = -1 })
-- end, opts)
-- m.map('n', ']d', function()
--   vim.diagnostic.jump({ count = 1 })
-- end, opts)
m.map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Additional diagnostic keymaps
-- m.map('n', '[e', function()
--   vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
-- end, opts)
-- m.map('n', ']e', function()
--   vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
-- end, opts)
m.map('n', '[w', function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
end, opts)
m.map('n', ']w', function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
end, opts)

local on_attach = function(_, bufnr)
end

-- local protocol = require('vim.lsp.protocol')

require('mason').setup()
local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  -- https://github.com/typescript-language-server/typescript-language-server/issues/216
  return string.match(value.targetUri, 'react/index.d.ts') == nil
end

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'jsonls',
    'astro',
    'tailwindcss',
    'gopls',
  },
  handlers = {
    function(server)
      if not lspconfig[server] then
        return
      end

      lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    lua_ls = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
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
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
    ts_ls = function()
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
        cmd = { 'typescript-language-server', '--stdio' },
        handlers = {
          ['textDocument/definition'] = function(err, result, method, ...)
            if vim.tbl_islist(result) and #result > 1 then
              local filtered_result = filter(result, filterReactDTS)
              return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
            end

            vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
          end,
        },
      })
    end,
    gopls = function()
      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
          },
        },
      })
    end,
  },
})
