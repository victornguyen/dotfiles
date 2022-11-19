local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  -- Define sources!
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },

  -- Format on save
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(c)
              -- Ensure we're only using null-ls for formatting
              -- We don't want to double-up on formatting duties with any language
              -- that include formatting...
              return c.name == 'null-ls'
            end,
          })
        end,
      })
    end
  end,
})
