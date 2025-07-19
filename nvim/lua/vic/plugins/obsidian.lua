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
  'epwalsh/obsidian.nvim',
  version = 'v3.9.0', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    'BufReadPre ' .. wiki_path .. '/*.md',
    'BufNewFile ' .. wiki_path .. '/*.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = wiki_path,
      },
    },
  },
}
