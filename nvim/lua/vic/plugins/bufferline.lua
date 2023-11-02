return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        indicator = {
          style = 'none',
        },
        separator_style = 'thin',
        buffer_close_icon = '',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Comment',
            separator = false,
          },
        },
      },
    })
  end,
}
