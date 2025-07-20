local function get_wiki_path()
  local config_dir = vim.fn.stdpath('config')
  local local_config = config_dir .. '/lua/vic/local.lua'

  if vim.fn.filereadable(local_config) == 1 then
    local ok, config = pcall(dofile, local_config)
    if ok and config.wiki_path then
      return vim.fn.expand(config.wiki_path)
    end
  end

  return vim.fn.expand('~/wiki') -- fallback
end

local wiki_path = get_wiki_path()

return {
  'obsidian-nvim/obsidian.nvim',
  branch = 'main',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = {
    'BufReadPre ' .. wiki_path .. '/*.md',
    'BufNewFile ' .. wiki_path .. '/*.md',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = wiki_path,
      },
    },
    legacy_commands = false,
    daily_notes = {
      folder = 'dailies',
      date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      -- alias_format = '%B %-d, %Y',
      -- Optional, default tags to add to each new daily note created.
      default_tags = { 'daily-notes' },
    },
  },
}
