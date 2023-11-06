return {
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
      ensure_installed = 'all',
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
            ['af'] = { query = '@function.outer', desc = 'Select outer part of a function' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a function' },
            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter' },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = { query = '@function.outer', desc = 'Move to the start of the next function' },
            [']a'] = { query = '@parameter.outer', desc = 'Move to the start of the next parameter' },
          },
          goto_next_end = {
            [']F'] = { query = '@function.outer', desc = 'Move to the end of the next function' },
            [']A'] = { query = '@parameter.outer', desc = 'Move to the end of the next parameter' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@function.outer', desc = 'Move to the start of the prev function' },
            ['[a'] = { query = '@parameter.outer', desc = 'Move to the start of the prev parameter' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@function.outer', desc = 'Move to the start of the prev function' },
            ['[A'] = { query = '@parameter.outer', desc = 'Move to the end of the prev parameter' },
          },
        },
      },
    })
  end,
}
