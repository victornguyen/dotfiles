return {
  -- enabled = false,
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  -- opts = {
  --   filter_kind = false, -- see :help SymbolKind
  -- },
  config = function(_, opts)
    local harpoon = require('harpoon')
    harpoon:setup()

    -- local conf = require('telescope.config').values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end

    --   require('telescope.pickers')
    --     .new({}, {
    --       prompt_title = 'Harpoon',
    --       finder = require('telescope.finders').new_table({
    --         results = file_paths,
    --       }),
    --       -- previewer = conf.file_previewer({}),
    --       sorter = conf.generic_sorter({}),
    --     })
    --     :find()
    -- end

    -- vim.keymap.set('n', '<leader>o', function()
    --   toggle_telescope(harpoon:list())
    -- end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end)

    -- TODO: figure out binds for jumping to marked files
    -- vim.keymap.set('n', '<C-a>', function()
    --   harpoon:list():select(1)
    -- end)
    -- vim.keymap.set('n', '<C-s>', function()
    --   harpoon:list():select(2)
    -- end)
    -- vim.keymap.set('n', '<C-d>', function()
    --   harpoon:list():select(3)
    -- end)
    -- vim.keymap.set('n', '<C-f>', function()
    --   harpoon:list():select(4)
    -- end)

    -- TODO: figure out binds for navigating marked files
    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set('n', '<C-S-P>', function()
    --   harpoon:list():prev()
    -- end)
    -- vim.keymap.set('n', '<C-S-N>', function()
    --   harpoon:list():next()
    -- end)

    harpoon:extend({
      -- TODO: can i use this to create binds that are only active when the Harpoon UI is active?
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-x>', function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-c>', function()
          harpoon.ui:close_menu()
        end, { buffer = cx.bufnr })
      end,
    })
  end,
}
