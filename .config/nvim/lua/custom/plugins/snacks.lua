return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    lazygit = { enabled = true },
    bufdelete = { enabled = true },
    git = { enabled = true },
  },
  keys = {
    {
      '<leader>gg',
      function()
        require('snacks').lazygit()
      end,
      desc = 'LazyGit',
    },
    {
      '<leader>gl',
      function()
        require('snacks').lazygit.log()
      end,
      desc = 'LazyGit Log',
    },
    {
      '<leader>bd',
      function()
        require('snacks').bufdelete()
      end,
      desc = 'Close buffer',
    },
  },
}
