local configs = require('nvim-treesitter.configs')
configs.setup {
  ensure_installed = 'all',
  sync_install = false,
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' },
    additional_vim_regex_highlighting = false -- turn this back on if indenting is weird
  },
  indent = {
    enable = true,
    disable = { '' }
  },
  rainbow = {
    enable = true,
  },
}
