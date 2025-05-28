return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'folke/which-key.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local wk = require 'which-key'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end)
    wk.add {
      { '<leader>h', desc = '[H]arpoon', mode = 'n' },
      { '<leader>hh', desc = 'Quick Menu', mode = 'n' },
      { '<leader>ha', desc = '[A]dd', mode = 'n' },
      { '<leader>hn', desc = '[N]ext', mode = 'n' },
      { '<leader>hp', desc = '[P]revious', mode = 'n' },
      { '<leader>h1', desc = 'Jump to [1]', mode = 'n' },
      { '<leader>h2', desc = 'Jump to [2]', mode = 'n' },
      { '<leader>h3', desc = 'Jump to [3]', mode = 'n' },
      { '<leader>h4', desc = 'Jump to [4]', mode = 'n' },
    }
  end,
}
