return {
  'shaunsingh/nord.nvim',
  config = function()
    vim.cmd 'colorscheme nord'
    vim.g.nord_disable_background = true
    require('nord').set()
  end,
}
