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
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'VeryLazy',
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
    preferred_link_style = 'markdown',
    checkbox = {
      order = { ' ', 'x', '~', '!', '>' },
    },
  },
  keys = {
    -- Essential daily workflow
    { '<leader>ot', '<cmd>Obsidian today<cr>', desc = 'Obsidian: Open today' },
    { '<leader>op', '<cmd>Obsidian quick_switch<cr>', desc = 'Obsidian: Quick switch' },
    { '<leader>os', '<cmd>Obsidian search<cr>', desc = 'Obsidian: Search notes' },
    { '<leader>on', '<cmd>Obsidian new<cr>', desc = 'Obsidian: New note' },

    -- Navigation and links
    { '<leader>ob', '<cmd>Obsidian backlinks<cr>', desc = 'Obsidian: Show backlinks' },
    { '<leader>ol', '<cmd>Obsidian links<cr>', desc = 'Obsidian: Show links' },

    -- Additional useful commands
    { '<leader>og', '<cmd>Obsidian tags<cr>', desc = 'Obsidian: Browse tags' },
    { '<leader>oy', '<cmd>Obsidian yesterday<cr>', desc = 'Obsidian: Open yesterday' },
    { '<leader>om', '<cmd>Obsidian tomorrow<cr>', desc = 'Obsidian: Open tomorrow' },
    { '<leader>od', '<cmd>Obsidian dailies<cr>', desc = 'Obsidian: Browse dailies' },
    { '<leader>oc', '<cmd>Obsidian toc<cr>', desc = 'Obsidian: Table of contents' },
    {
      '<leader>oe',
      '<cmd>Obsidian extract_note<cr>',
      desc = 'Obsidian: Extract to new note',
      mode = 'v',
    },
    {
      '<leader>ol',
      '<cmd>Obsidian link_new<cr>',
      desc = 'Obsidian: Create link from selection',
      mode = 'v',
    },
    { '<leader>or', '<cmd>Obsidian rename<cr>', desc = 'Obsidian: Rename note' },
    { '<leader>oO', '<cmd>Obsidian open<cr>', desc = 'Obsidian: Open in app' },
    {
      '<leader>ok',
      function()
        local builtin = require('telescope.builtin')
        builtin.live_grep({
          search_dirs = { vim.fn.expand('%:p') },
          default_text = '- \\[ \\]',
          prompt_title = 'Find Unchecked Checkboxes',
        })
      end,
      desc = 'Obsidian: Find unchecked checkboxes',
    },
  },
}
