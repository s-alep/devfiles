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

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
