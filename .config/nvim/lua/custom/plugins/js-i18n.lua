return {
  'nabekou29/js-i18n.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    primary_language = { 'en' },
  },
  init = function()
    vim.keymap.set('n', '<leader>te', ':I18nEditTranslation<CR>', { desc = 'Edit translation', silent = true })
    vim.keymap.set('n', '<leader>tt', ':I18nVirtualTextToggle<CR>', { desc = 'Toggle virtual text', silent = true })

    local wk = require 'which-key'
    wk.add {
      { '<leader>i', desc = '[I]18n Translation', mode = 'n' },
      { '<leader>ie', desc = '[E]dit translation', mode = 'n' },
      { '<leader>ti', desc = '[T]oggle [I]18n virtual text', mode = 'n' },
    }
  end,
}
