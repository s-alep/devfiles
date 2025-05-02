return {
  'folke/snacks.nvim',
  opts = {
    scratch = { enabled = true },
    indent = {
      priority = 1,
      enabled = true,
      char = '│',
      only_scope = false,
      only_current = false,
      hl = 'SnacksIndent',
    },
  },
  keys = {
    {
      '<leader>tp',
      function()
        Snacks.scratch()
      end,
      desc = '[T]oggle Scratch[P]ad',
    },
    {
      '<leader>ss',
      function()
        Snacks.scratch.select()
      end,
      desc = '[S]earch [S]cratchpads',
    },
  },
}
