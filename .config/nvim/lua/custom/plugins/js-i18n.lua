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
      { '<leader>t', desc = 'I18n [T]ranslation', mode = 'n' },
      { '<leader>te', desc = '[E]dit translation', mode = 'n' },
      { '<leader>tt', desc = '[T]oggle virtual text', mode = 'n' },
    }
  end,
}
