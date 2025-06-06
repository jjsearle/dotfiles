return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'gemini',
      },
      inline = {
        adapter = 'gemini',
      },
    },
    providers = {
      gemini = function()
        return require('codecompanion.adapters').extend('gemini', {
          env = {
            api_key = vim.env.GEMINI_API_KEY,
          },
          schema = {
            model = {
              default = 'gemini-2.5-pro-exp-03-25:free',
            },
          },
        })
      end,
    },
  },
  init = function()
    vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })
    local wk = require 'which-key'
    wk.add {
      { '<leader>cc', desc = '[C]ode[C]ompanion Toggle', mode = 'n' },
    }
  end,
}
