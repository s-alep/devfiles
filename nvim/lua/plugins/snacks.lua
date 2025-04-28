return {
  'folke/snacks.nvim',
  opts = {
    scratch = { enabled = true },
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
