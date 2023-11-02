-- Set <space> as leader key
-- NOTE: needs to be set before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('vic.config')
require('vic.options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('vic.plugins', {
  lockfile = '~/.dotfiles/nvim/lazy-lock.json',
  change_detection = {
    notify = false
  }
})

require('vic.lsp')
require('vic.keymaps')
