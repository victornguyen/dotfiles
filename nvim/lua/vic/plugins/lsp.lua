-- LSP plugins
return {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'lukas-reineke/lsp-format.nvim' },
  },
}
