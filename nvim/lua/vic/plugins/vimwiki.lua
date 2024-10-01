return {
  'vimwiki/vimwiki',
  keys = { '<leader>w' },
  branch = 'dev',
  init = function()
    local set_var = vim.api.nvim_set_var
    set_var('vimwiki_table_mappings', 0) -- prevent <Tab> mapping conflicts
    set_var('vimwiki_global_ext', 0) -- ignore non-wiki md files
    set_var('vimwiki_markdown_link_ext', 1) -- ensure .'md' is appended to internal links
    set_var('vimwiki_listsyms', ' .oox') -- checkbox symbol char progression
    set_var('vimwiki_hl_headers', 1)

    -- Load local configuration if it exists
    -- Example local configuration file:
    -- return {
    -- 	{
    -- 		name = "Wiki name",
    -- 		path = "$HOME/path/to/wiki",
    -- 		syntax = "markdown",
    -- 		ext = ".md",
    -- 	}
    -- }
    local local_config_path = vim.fn.expand('$HOME/.vimwiki_local.lua')
    local local_config_exists = vim.fn.filereadable(local_config_path) == 1

    if local_config_exists then
      local ok, local_config = pcall(dofile, local_config_path)
      if ok and type(local_config) == 'table' then
        set_var('vimwiki_list', local_config)
      else
        vim.notify('Failed to load local vimwiki configuration', vim.log.levels.ERROR)
      end
    else
      -- Default Wikis
      set_var('vimwiki_list', {
        {
          name = 'Me',
          path = '$HOME/Dropbox/vimwiki/me',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          name = 'Work',
          path = '$HOME/Dropbox/vimwiki/work',
          syntax = 'markdown',
          ext = '.md',
        },
      })
    end
  end,
  config = function()
    local m = require('vic.utils')

    -- Keymaps
    m.map('n', '[j', ':VimwikiDiaryPrevDay<CR>')
    m.map('n', ']j', ':VimwikiDiaryNextDay<CR>')
  end,
}
