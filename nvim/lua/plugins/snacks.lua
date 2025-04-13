return {
  'folke/snacks.nvim',
  opts = {
    scratch = { enabled = true },
    terminal = {},
    styles = {
      zen = {
        enter = true,
        fixbuf = false,
        minimal = true,
        width = 185,
        height = 0,
        backdrop = { transparent = false, blend = 40 },
        keys = { q = false },
        zindex = 40,
        wo = {
          winhighlight = 'NormalFloat:Normal',
        },
        w = {
          snacks_main = true,
        },
      },
    },
    zen = { enabled = true },
    terminal ={},
    toggle = { enabled = true },
    dim = { enabled = true },
  },
  keys = {
      '<leader>tt',
      function()
        Snacks.terminal.open()
      end,
      desc = '[T]oggle [T]erminal',
    },
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = '[T]oggle [S]cratch Buffer',
    }, {
    '<leader>ts',
    function()
      Snacks.scratch()
    end,
    desc = '[T]oggle [S]cratch Buffer',
  },
    {
      '<leader>ss',
      function()
        Snacks.scratch.select()
      end,
      desc = '[S]earch [S]cratch Buffer',
    },
    {
      'tz',
      function()
        Snacks.zen.zen()
      end,
      desc = '[T]oggle [Z]en Mode',
    },
  },
}
