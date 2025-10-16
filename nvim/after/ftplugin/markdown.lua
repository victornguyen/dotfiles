vim.opt_local.conceallevel = 2

local function markdown_link_from_selection()
  local original = vim.fn.getreg('v')
  local original_type = vim.fn.getregtype('v')

  vim.cmd('noau normal! "vy')
  local text = vim.fn.getreg('v')
  if text == '' then
    vim.fn.setreg('v', original, original_type)
    return
  end

  vim.ui.input({ prompt = 'URL: ' }, function(url)
    if not url or url == '' then
      vim.fn.setreg('v', original, original_type)
      return
    end

    local replacement = ('[%s](%s)'):format(text, url)
    vim.fn.setreg('v', replacement, 'c')
    vim.cmd('normal! gv"vp')
    vim.fn.setreg('v', original, original_type)
  end)
end

vim.keymap.set('v', '<CR>', markdown_link_from_selection, {
  buffer = true,
  desc = 'Create Markdown link from selection',
})

vim.keymap.set('v', '<leader>oL', ':Obsidian link<CR>', {
  buffer = true,
  desc = 'Obsidian: Link selection',
})
