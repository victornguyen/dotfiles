local status, bufferline = pcall(require, 'bufferline')
if not status then
  return
end

bufferline.setup({
  options = {
    separator_style = 'slant',
    buffer_close_icon = '',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Comment',
        separator = true,
      },
    },
  },
})
