return {
"ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts= {
    transparent_mode = true,
  },
  init = function()
   vim.o.background = 'dark'
   vim.cmd 'colorscheme gruvbox'
  end,
}
