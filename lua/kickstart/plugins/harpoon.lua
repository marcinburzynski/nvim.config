return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)

    vim.keymap.set('n', '<C-m>1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-m>2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-m>3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-m>4', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<C-m>5', function()
      harpoon:list():select(5)
    end)
    vim.keymap.set('n', '<C-m>6', function()
      harpoon:list():select(6)
    end)

    vim.keymap.set('n', '<C-m>p', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-m>n', function()
      harpoon:list():next()
    end)

    vim.keymap.set('n', '<C-m>r', function()
      harpoon:list():remove()
    end)

    vim.keymap.set('n', '<C-m>c', function()
      harpoon:list():clear()
    end)

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
