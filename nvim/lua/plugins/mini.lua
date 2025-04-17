return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.sessions').setup {
      vim.keymap.set('n', '<leader>tl', '<CMD>lua MiniSessions.read()<CR>', { desc = '[T]oggle Session [L]oad' }),
      vim.keymap.set('n', '<leader>ts', '<CMD>mksession<CR>', { desc = '[T]oggle Session [S]tart' }),
    }
    require('mini.move').setup()
    require('mini.pairs').setup()
    require('mini.splitjoin').setup {
      mappings = {
        toggle = 'gj',
        split = '',
        join = '',
      },
    }
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
