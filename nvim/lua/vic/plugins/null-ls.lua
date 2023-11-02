return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'lukas-reineke/lsp-format.nvim' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local null_ls_ok, null_ls = pcall(require, 'null-ls')
    local lspformat_ok, lspformat = pcall(require, 'lsp-format')

    if not (null_ls_ok and lspformat_ok) then
      vim.api.nvim_err_writeln('null-ls or lsp-format not installed!')
      return
    end

    null_ls.setup({
      -- Define sources!
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
      },

      -- Format on save
      -- TODO: need this and lsp? shouldn't need this as null-ls creates a pseudo language server to attach to LSP anyway
      -- on_attach = lspformat.on_attach,
    })
  end,
}
