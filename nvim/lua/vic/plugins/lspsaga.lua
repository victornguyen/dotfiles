-- Optional: Enhanced LSP UI with better diagnostics
return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({
      ui = {
        kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
      },
      diagnostic = {
        -- Show diagnostics in normal mode
        on_insert = false,
        on_insert_follow = false,
        insert_winblend = 0,
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        max_width = 0.7,
        max_height = 0.6,
        max_show_width = 0.9,
        max_show_height = 0.6,
        text_hl_follow = true,
        border_follow = true,
        extend_relatedInformation = false,
        keys = {
          exec_action = 'o',
          quit = 'q',
          go_action = 'g',
        },
      },
      code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = true,
        keys = {
          quit = 'q',
          exec = '<CR>',
        },
      },
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
      },
      hover = {
        max_width = 0.6,
        open_link = 'gx',
        open_browser = '!open',
      },
      rename = {
        quit = '<C-c>',
        exec = '<CR>',
        mark = 'x',
        confirm = '<CR>',
        in_select = true,
      },
      definition = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
      },
      finder = {
        max_height = 0.5,
        min_width = 30,
        force_max_height = false,
        keys = {
          jump_to = 'p',
          expand_or_jump = 'o',
          vsplit = 's',
          split = 'i',
          tabe = 't',
          tabnew = 'r',
          quit = { 'q', '<ESC>' },
          close_in_preview = '<ESC>',
        },
      },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  -- Optional keymaps for lspsaga (comment out if you prefer existing ones)
  keys = {
    { '<leader>ca', '<cmd>Lspsaga code_action<cr>', desc = 'Code Action' },
    { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover Doc' },
    { 'gd', '<cmd>Lspsaga goto_definition<cr>', desc = 'Goto Definition' },
    { 'gy', '<cmd>Lspsaga goto_type_definition<cr>', desc = 'Goto Type Definition' },
    { 'gp', '<cmd>Lspsaga peek_definition<cr>', desc = 'Peek Definition' },
    { 'gr', '<cmd>Lspsaga finder<cr>', desc = 'Find References' },
    { '<leader>ao', '<cmd>Lspsaga outline<cr>', desc = 'Symbols Outline' },
    { '<leader>rn', '<cmd>Lspsaga rename<cr>', desc = 'Rename' },
    { '<leader>ad', '<cmd>Lspsaga show_line_diagnostics<cr>', desc = 'Line Diagnostics' },
    { '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = 'Previous Diagnostic' },
    { ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = 'Next Diagnostic' },
  },
}
