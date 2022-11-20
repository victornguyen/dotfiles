local g = vim.g
local m = require('vic.utils')

g.vimwiki_table_mappings = 0 -- prevent <Tab> mapping conflicts
g.vimwiki_global_ext = 0 -- ignore non-wiki md files
g.vimwiki_markdown_link_ext = 1 -- ensure .'md' is appended to internal links
-- g.vimwiki_listsyms = ' ○◐●' -- cannot match with lua patterns sadness
g.vimwiki_listsyms = ' .oox'
g.vimwiki_hl_headers = 1

-- Wikis
g.vimwiki_list = {
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
}

-- Keymaps
m.map('n', '[j', ':VimwikiDiaryPrevDay<CR>')
m.map('n', ']j', ':VimwikiDiaryNextDay<CR>')
