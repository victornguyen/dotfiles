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
    ui = {
      enable = false,
    },
    daily_notes = {
      folder = 'dailies',
      date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      -- alias_format = '%B %-d, %Y',
      -- Optional, default tags to add to each new daily note created.
      default_tags = { 'daily-notes' },
    },
  },
  keys = {
    -- Essential daily workflow
    { '<leader>ot', '<cmd>Obsidian today<cr>', desc = 'Obsidian: Open today', ft = 'markdown' },
    { '<leader>oo', '<cmd>Obsidian quick_switch<cr>', desc = 'Obsidian: Quick switch', ft = 'markdown' },
    { '<leader>os', '<cmd>Obsidian search<cr>', desc = 'Obsidian: Search notes', ft = 'markdown' },
    { '<leader>on', '<cmd>Obsidian new<cr>', desc = 'Obsidian: New note', ft = 'markdown' },

    -- Navigation and links
    { '<leader>ob', '<cmd>Obsidian backlinks<cr>', desc = 'Obsidian: Show backlinks', ft = 'markdown' },
    { '<leader>ol', '<cmd>Obsidian links<cr>', desc = 'Obsidian: Show links', ft = 'markdown' },

    -- Additional useful commands
    { '<leader>og', '<cmd>Obsidian tags<cr>', desc = 'Obsidian: Browse tags', ft = 'markdown' },
    { '<leader>oy', '<cmd>Obsidian yesterday<cr>', desc = 'Obsidian: Open yesterday', ft = 'markdown' },
    { '<leader>om', '<cmd>Obsidian tomorrow<cr>', desc = 'Obsidian: Open tomorrow', ft = 'markdown' },
    { '<leader>od', '<cmd>Obsidian dailies<cr>', desc = 'Obsidian: Browse dailies', ft = 'markdown' },
    { '<leader>oc', '<cmd>Obsidian toc<cr>', desc = 'Obsidian: Table of contents', ft = 'markdown' },
    {
      '<leader>oe',
      '<cmd>Obsidian extract_note<cr>',
      desc = 'Obsidian: Extract to new note',
      mode = 'v',
      ft = 'markdown',
    },
    { '<leader>or', '<cmd>Obsidian rename<cr>', desc = 'Obsidian: Rename note', ft = 'markdown' },
    { '<leader>oO', '<cmd>Obsidian open<cr>', desc = 'Obsidian: Open in app', ft = 'markdown' },
  },
}
