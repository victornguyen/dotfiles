-- Bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Reload nvim and packer whenever plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, 'packer')
if not status then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Yo dawg...
  use('wbthomason/packer.nvim')

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use({
    'lukas-reineke/lsp-format.nvim',
    config = function()
      require('lsp-format').setup({})
    end,
  })
  use('neovim/nvim-lspconfig', { requires = 'lukas-reineke/lsp-format.nvim' })

  -- Show LSP progress
  use({
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require('fidget').setup()
    end,
  })

  -- Which Key
  use({
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require('which-key').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  -- Formatters
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'lukas-reineke/lsp-format.nvim' },
    config = function()
      require('vic.plugins.null-ls')
    end,
  })

  -- Snippets
  use({
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('vic.plugins.luasnip')
    end,
  })

  -- Autopairs
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('vic.plugins.nvim-autopairs')
    end,
  })

  -- Autocomplete
  use({
    'hrsh7th/nvim-cmp',
    -- Sources for nvim-cmp
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
      'windwp/nvim-autopairs',
    },
    config = function()
      require('vic.plugins.cmp')
    end,
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('vic.plugins.telescope')
    end,
  })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- nvim-tree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('vic.plugins.nvim-tree')
    end,
  })

  -- lualine
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('vic.plugins.lualine')
    end,
  })

  -- Bufferline
  use({
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('vic.plugins.bufferline')
    end,
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/playground',
    },
    run = ':TSUpdate',
    config = function()
      require('vic.plugins.treesitter')
    end,
  })

  -- Syntax
  use('fladson/vim-kitty')

  -- Git
  use({
    'tpope/vim-fugitive',
    requires = {
      'tpope/vim-rhubarb', -- Github support
      'tommcdo/vim-fubitive', -- Bitbucket support
    },
    config = function()
      require('vic.plugins.fugitive')
    end,
  })
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('vic.plugins.gitsigns')
    end,
  })

  -- Tim Pope
  use('tpope/vim-commentary')
  use('tpope/vim-unimpaired')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('tpope/vim-eunuch')

  -- Chris Toomey
  use('christoomey/vim-sort-motion')
  use('christoomey/vim-system-copy')
  use({
    'christoomey/vim-tmux-navigator',
    config = function()
      require('vic.plugins.vim-tmux-navigator')
    end,
  })

  -- More text objects
  use('wellle/targets.vim')

  -- Alignment
  use('junegunn/vim-easy-align')

  -- Better f
  use({
    'rhysd/clever-f.vim',
    config = function()
      require('vic.plugins.clever-f')
    end,
  })

  -- Smooth scrolling
  use('psliwka/vim-smoothie')

  -- Theme
  use({
    'folke/tokyonight.nvim',
    config = function()
      require('vic.plugins.tokyonight')
    end,
  })

  -- Paint
  use({
    'folke/paint.nvim',
    config = function()
      require('vic.plugins.paint')
    end,
  })

  -- VimWiki
  use({
    'vimwiki/vimwiki',
    branch = 'dev',
    config = function()
      require('vic.plugins.vimwiki')
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
