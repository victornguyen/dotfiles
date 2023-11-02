return {
  'hrsh7th/nvim-cmp',
  -- Sources for nvim-cmp
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
    'windwp/nvim-autopairs',
  },
  config = function()
    local cmp_ok, cmp = pcall(require, 'cmp')
    local luasnip_ok, luasnip = pcall(require, 'luasnip')
    local lspkind_ok, lspkind = pcall(require, 'lspkind')
    local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')

    if not (cmp_ok and luasnip_ok and lspkind_ok and cmp_autopairs_ok) then
      vim.api.nvim_err_writeln('nvim-cmp, cmp_luasnip, lspkind or nvim-autopairs not installed!')
      return
    end

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),

        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
        }),

        -- Open/close autocomplete
        ['<C-Space>'] = function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end,

        -- Super-Tab like mapping
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              -- Include text from other buffers in cmp suggestions
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = 'luasnip' },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
        }),
      },
    })

    -- NOTE: disabling for now... don't feel i need it for inline search terms
    -- -- `/` cmdline setup.
    -- cmp.setup.cmdline('/', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = 'buffer' }
    --   }
    -- })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })

    -- Insert `(` after selecting a function or method item
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
  end,
}
