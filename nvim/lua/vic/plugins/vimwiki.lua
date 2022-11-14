local g = vim.g

g.vimwiki_table_mappings = 0 -- to prevent <Tab> mapping conflicts
g.vimwiki_global_ext = 0 -- what is this again>?
g.vimwiki_markdown_link_ext = 1 -- ensure .'md' is appended to internal links
g.vimwiki_listsyms = ' ○◐●'

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
