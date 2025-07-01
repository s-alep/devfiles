return {
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  {
    'Mofiqul/dracula.nvim',
  },
  {
    'catppuccin/nvim',
    lazy = false,
  },
  { 'shaunsingh/nord.nvim' },
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  { 'ramojus/mellifluous.nvim' },
  { 'sainnhe/gruvbox-material' },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'rebelot/kanagawa.nvim' },
  {
    'zootedb0t/citruszest.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'Everblush/nvim', name = 'everblush' },
  {
    'cryptomilk/nightcity.nvim',
    version = '*',
    config = function()
      require('nightcity').setup {
        on_highlights = function(groups, c)
          groups.String = { fg = c.green, bg = c.none }
        end,
      }
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'olimorris/onedarkpro.nvim',
  },
}
