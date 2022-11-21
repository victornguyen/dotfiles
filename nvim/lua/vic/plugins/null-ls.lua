local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then
  return
end

local format_ok, lspformat = pcall(require, 'lsp-format')
if not format_ok then
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
  on_attach = lspformat.on_attach,
})
