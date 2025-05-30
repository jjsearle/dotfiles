return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup {
      use_default_keymaps = false,
    }

    vim.keymap.set('n', '<leader>cm', require('treesj').toggle)
    vim.keymap.set('n', '<leader>cj', require('treesj').join)
    vim.keymap.set('n', '<leader>cs', require('treesj').split)

    local wk = require 'which-key'
    wk.add {
      { '<leader>cm', desc = 'TSJ Toggle', mode = 'n' },
      { '<leader>cj', desc = 'TSJ [J]oin', mode = 'n' },
      { '<leader>cs', desc = 'TSJ [S]plit', mode = 'n' },
    }
  end,
}
