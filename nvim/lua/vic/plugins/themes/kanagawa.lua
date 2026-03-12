require('kanagawa').setup({
  theme = 'dragon',
  dimInactive = true,
  background = {
    dark = 'dragon',
    light = 'lotus',
  },
  colors = {
    theme = {
      dragon = {
        ui = {
          pmenu = {
            bg = '#282727', -- dragonBlack4 (warm, matches dragon palette)
            bg_sel = '#393836', -- dragonBlack5
            bg_sbar = '#282727', -- dragonBlack4
            bg_thumb = '#393836', -- dragonBlack5
          },
        },
      },
    },
  },
  overrides = function(colors)
    local theme = colors.theme
    return {
      -- Noice cmdline popup border defaults to DiagnosticSignInfo (cool blue),
      -- override to use the warm dragon float border color instead
      NoiceCmdlinePopupBorder = { fg = theme.ui.float.fg_border },
      NoiceCmdlinePopupTitle = { fg = theme.ui.float.fg_border },
      NoiceCmdlineIcon = { fg = theme.ui.float.fg_border, bg = 'NONE' },
    }
  end,
})

vim.cmd.colorscheme('kanagawa-dragon')
