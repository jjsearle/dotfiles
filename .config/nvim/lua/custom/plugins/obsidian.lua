local wk = require 'which-key'

wk.add {
  { '<leader>o', group = '[O]bsidian' },
  { '<leader>oo', desc = '[O]bsidian [O]pen', mode = 'n' },
  { '<leader>ot', desc = '[O]bsidian [T]oday', mode = 'n' },
  { '<leader>oy', desc = '[O]bsidian [Y]esterday', mode = 'n' },
  { '<leader>on', desc = '[O]bsidian [N]ew', mode = 'n' },
  { '<leader>oe', desc = '[O]bsidian [E]xtract Note', mode = 'v' },
}

vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Obsidian Quick Switch' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = 'Obsidian Today' })
vim.keymap.set('n', '<leader>oy', '<cmd>ObsidianYesterday<CR>', { desc = 'Obsidian Yesterday' })
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Obsidian New' })
-- vim.keymap.set('v', '<leader>oe', '<cmd>ObsidianExtractNote<CR>', { desc = 'Obsidian Extract Note' })
vim.keymap.set('v', '<leader>oe', function()
  -- Get the selected text (single line, one word)
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"

  local line = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, start_pos[2], false)[1]
  local word = line:sub(start_pos[3], end_pos[3])

  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)

  -- Run the command
  vim.cmd('ObsidianExtractNote "' .. word .. '"')
end, { desc = 'Obsidian Extract Note' })

return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  ---@module 'obsidian'
  ---@type obsidian.config.ClientOpts
  opts = {
    workspaces = {
      {
        name = 'SecondBrain',
        path = '~/Documents/SecondBrain',
        overrides = {
          notes_subdir = '1 - Inbox',
        },
      },
    },
    daily_notes = {
      folder = '3 - Daily Notes',
    },
    new_notes_location = 'notes_subdir',
    notes = {
      folder = '4 - Main Notes',
    },
    completion = {
      nvim_cmp = false,
      blink = true,
    },
    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      local title = spec.title or 'untitled'
      local filename = tostring(spec.id) .. '_' .. title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      -- This is equivalent to the default behavior.
      local path = spec.dir / filename
      return path:with_suffix '.md'
    end,
  },
}
