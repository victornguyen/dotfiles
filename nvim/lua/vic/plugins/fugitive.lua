local function read_file(file_path)
  local file = io.open(file_path, 'r')
  if not file then
    return nil, 'File not found: ' .. file_path
  end
  local content = file:read('*all')
  file:close()
  return content
end

local function parse_urls(content)
  local urls = {}
  for url in content:gmatch('[^\r\n]+') do
    table.insert(urls, url)
  end
  return urls
end

return {
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb', -- Github support!
    'tommcdo/vim-fubitive', -- Bitbucket support
  },
  config = function()
    local m = require('vic.utils')

    m.map('n', '<leader>gb', ':Git blame<cr>')
    m.map('n', '<leader>gd', ':Gdiffsplit!<cr>')
    m.map('n', '<leader>gs', ':Git<cr>')
    m.map('n', '<leader>gl', ':0Gclog<cr>')
    m.map('n', '<leader>go', ':GBrowse<cr>')

    m.map('n', 'gh', '<cmd>diffget //2<cr>')
    m.map('n', 'gl', '<cmd>diffget //3<cr>')

    -- Define the path to the .local file
    -- Example (one url per line):
    -- https://github.company.com
    -- https://github.domain.com
    local local_file_path = vim.fn.expand('~/.github_enterprise_urls')

    -- Read the file content
    local content, err = read_file(local_file_path)
    if content then
      -- Parse the URLs from the file content
      local github_enterprise_urls = parse_urls(content)
      -- Set the URLs as a Vim variable
      vim.api.nvim_set_var('github_enterprise_urls', github_enterprise_urls)
    end
  end,
}
