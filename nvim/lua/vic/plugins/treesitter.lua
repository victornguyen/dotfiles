return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground',
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
          local move = require('nvim-treesitter.textobjects.move') ---@type table<string,fun(...)>
          local configs = require('nvim-treesitter.configs')
          for name, fn in pairs(move) do
            if name:find('goto') == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module('textobjects.move')[name] ---@type table<string,string>
                  for key, query in pairs(config or {}) do
                    if q == query and key:find('[%]%[][cC]') then
                      vim.cmd('normal! ' .. key)
                      return
                    end
                  end
                end
                return fn(q, ...)
              end
            end
          end
        end,
      },
    },
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup({
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'jsonc',
          'lua',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'python',
          'query',
          'regex',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false, -- turn this back on if indenting is weird
        },
        indent = {
          enable = true,
          disable = { '' },
        },
        textobjects = {
          select = {
            enable = true,
            include_surrounding_whitespace = true,
            lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = { query = '@function.outer', desc = 'a function' },
              ['if'] = { query = '@function.inner', desc = 'inner function' },
              ['ac'] = { query = '@class.outer', desc = 'a class' },
              ['ic'] = { query = '@class.inner', desc = 'inner class' },
              ['aa'] = { query = '@parameter.outer', desc = 'a parameter' },
              ['ia'] = { query = '@parameter.inner', desc = 'inner parameter' },
              ['aC'] = { query = '@conditional.outer', desc = 'a conditional' },
              ['iC'] = { query = '@conditional.inner', desc = 'inner conditional' },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = { query = '@function.outer', desc = 'Move to the start of the next function' },
            },
            goto_next_end = {
              [']F'] = { query = '@function.outer', desc = 'Move to the end of the next function' },
            },
            goto_previous_start = {
              ['[f'] = { query = '@function.outer', desc = 'Move to the start of the prev function' },
            },
            goto_previous_end = {
              ['[F'] = { query = '@function.outer', desc = 'Move to the start of the prev function' },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['[w'] = { query = '@parameter.inner', desc = 'Swap with next parameter' },
            },
            swap_previous = {
              ['[w'] = { query = '@parameter.inner', desc = 'Swap with prev parameter' },
            },
          },
        },
      })
    end,
  },
  {
    enabled = true,
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      separator = '▁', -- "TreesitterContextSeparator"}, -- alts: ▁ ─ ▄─▁
      min_window_height = 5, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      mode = 'cursor', -- cursor, topline
      max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = 'outer',
    },
    config = function()
      -- Bind jump to context
      local m = require('vic.utils')
      m.map(
        'n',
        'gC',
        ":lua require('treesitter-context').go_to_context()<cr>",
        { silent = true, desc = 'Jump to treesitter context' }
      )

      -- Style last line of context window
      vim.cmd('hi TreesitterContextBottom gui=underline guifg=#494D64')
    end,
  },
}
