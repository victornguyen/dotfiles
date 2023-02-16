local status, paint = pcall(require, 'paint')
if not status then
  return
end

paint.setup({
  highlights = {
    -- Todo tag
    -- anything:
    {
      filter = { filetype = 'vimwiki' },
      pattern = ']%s([%w]+:)%s',
      hl = 'Function',
    },

    -- nvim link
    -- [nvim](./vim.md):
    {
      filter = { filetype = 'vimwiki' },
      pattern = '%[nvim%]%(%./[%w]+%.md%):',
      hl = 'String',
    },

    -- wiki link
    -- [wiki](./wiki.md):
    {
      filter = { filetype = 'vimwiki' },
      pattern = '%[wiki%]%(%./[%w]+%.md%):',
      hl = 'Constant',
    },

    -- Name
    -- @vic
    {
      filter = { filetype = 'vimwiki' },
      pattern = '%s(%@[%w_]+)',
      hl = '@punctuation.special.markdown',
    },

    -- Completed todo checkbox
    -- - [x]
    {
      filter = { filetype = 'vimwiki' },
      pattern = '- %[x%]',
      hl = 'Character',
    },

    -- Completed todo text
    -- - [x] Todo text to match
    -- TODO: try to get this work, probs not a good idea and conflicting with
    -- pair highlight filters anyway?
    -- {
    --   filter = { filetype = 'vimwiki' },
    --   pattern = '- %[x%]%s([%w]+)\n',
    --   hl = 'Comment',
    -- },
  },
})
