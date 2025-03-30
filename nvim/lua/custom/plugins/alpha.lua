return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('p', '  Pick File', ':Telescope find_files<CR>'),
      dashboard.button('o', '󰏇  Oil', '<cmd>Oil<CR>'),
      dashboard.button('r', '󱠇  MRU', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('s', '  Load Last Lession', '<cmd>lua MiniSessions.read()<CR>'),
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }
    dashboard.section.header.val = {
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣿⣿⣿⣿⣿⣿⡿⠟⠉⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠈⠼⢛⣩⣀⣨⣥⣶⣏⣀⠹⣿⣿⣿⡿⠟⢉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⢸⣿⠟⠁⠼⣋⣴⣾⣾⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣤⣬⣀⠀⠛⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⣡⡆⠘⣡⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣖⣀⢠⣍⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠸⡟⠀⣠⣿⣯⣾⣿⣿⣿⣿⣿⣿⡿⡿⢋⣴⣿⡿⢿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣤⡈⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢰⣧⢀⣾⣿⣿⣿⣿⣿⣿⣿⣶⢐⠏⡜⢰⠟⣿⠟⡴⢋⣴⡿⢛⣽⣿⣿⣿⣿⣿⠛⣩⣿⣿⣿⣿⣿⣏⠐⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⢂⣿⣿⣿⣿⢿⡿⢸⣿⡿⢿⡟⡋⡿⢿⡿⢡⠆⣯⣼⣱⡟⠋⢀⣥⡾⠿⢿⣿⡟⣋⡾⢋⣽⣿⣿⣿⣿⣿⣧⡈⠻⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣾⣿⣿⣿⣿⡎⣰⡼⣿⣿⡌⢰⡇⠁⢸⠀⠛⢐⡉⣹⣿⡏⢀⡿⢁⠀⣴⣿⣿⠋⡩⢐⣽⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⢸⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣘⠈⣻⡟⣿⡟⢹⡿⢁⠙⠀⠿⣿⠇⠘⢡⠇⡄⢂⣾⠟⠸⢟⣫⡖⢈⡴⢃⣈⣿⡷⢐⣣⠖⣘⡽⣛⣿⣿⣛⠟⣛⣻⣿⣿⣿⠦⠙⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⢡⠸⢣⠸⡇⣾⠀⣷⢠⡏⣤⢴⠟⢛⣡⣌⡉⠈⠛⠦⡉⣬⣭⣴⣶⣶⣤⣭⣭⣙⣛⠻⢟⣻⣯⣿⠟⢛⠟⣋⣿⣿⡦⠄⢛⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠘⣿⠿⣇⠃⠸⣦⣇⠹⡦⠥⠿⠃⣈⡂⠨⣄⠙⣿⣿⣷⣮⣥⣦⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⢯⡭⢀⣼⠟⣚⣿⡿⣿⣄⠀⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢉⡛⠀⢿⣄⡀⢀⡑⠆⣉⣴⣶⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⡇⠀⣤⣶⠾⠿⢟⣑⣊⠽⣿⣷⣌⠻⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⡌⣿⣿⣧⠹⡇⢠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡙⢿⣿⣿⣿⠘⣷⡐⠾⣭⣍⣉⡴⢊⣭⣄⠲⢾⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠠⣸⣿⡇⠣⡁⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣯⢻⣿⣿⣿⣿⣿⣿⡿⢿⣿⡈⠻⣿⣿⡇⢻⠭⢅⠨⢛⣛⣷⣿⣿⡇⢸⣿⣿⣿⠿⠋',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⢿⡗⢤⣤⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢸⢸⣿⣿⡿⣿⣿⣿⣷⡜⣿⣷⣤⣽⣿⡇⢸⣪⡥⢚⣿⣾⣿⡿⢟⠁⠈⠛⠛⠁⠀⠀',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡍⢁⣤⣮⡀⢬⠘⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠘⣿⣿⣷⡌⣿⣿⣿⣷⠘⣿⣿⣿⣿⣷⣦⣍⠲⣿⣿⣿⡏⣴⢀⠉⢰⣦⡀⠀⠀⠀',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠻⣿⣿⣦⡀⢿⣇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢠⣿⣿⣿⡇⠈⣿⣿⣿⣇⠙⣛⣛⠻⢿⣿⣿⣧⠹⡿⠋⣸⢡⢸⡆⣾⣿⣿⣆⠀⠀',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⢈⣒⠲⠾⠈⠻⢸⠿⢛⣉⡙⢿⣿⣿⣿⣿⣿⣯⢻⣿⠞⣼⣿⣿⣿⣷⣾⣿⣿⡟⣡⠈⠿⠿⠿⢿⣿⣿⠿⠀⠴⠀⠇⠘⣾⡇⢿⣿⣿⣿⣦⠀',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡦⠙⣥⡀⣿⣧⡴⠎⣁⡙⠿⣿⣿⣿⣿⣿⣿⣿⡈⣯⢰⠘⣿⡿⠿⠟⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡇⡒⠀⠀⡄⡿⠁⢚⣿⣿⣿⣿⡇',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⢸⣧⢹⣯⣴⡿⠿⠿⠶⠬⠍⠙⠛⠛⠛⠿⠇⣿⠨⡑⠈⠀⠀⠀⢀⡤⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡇⠇⢰⡆⢰⠃⠀⢰⣿⣿⣿⣿⢃',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⡙⠌⠃⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡇⠁⠀⠀⠁⠀⠀⢺⣿⣿⣿⡿⣸',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠘⠆⠀⠀⠀⠛⠁⠀⠀⠀⠀⠀⠀⠀⢀⣶⠸⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⠁⠀⠀⠀⠀⠐⢦⡍⣹⣿⣿⣇⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠢⡄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⡀⢿⣿⣿⣿⣿⣷⣦⣤⡤⠄⢀⣂⣀⣙⡛⠿⣿⣿⣿⡀⠀⠀⢠⡘⣦⡱⣶⣿⣿⡟⣸⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣧⡄⠀⠈⢶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⡇⢸⣿⡿⢿⣿⡿⢛⣩⣶⣿⣿⣿⣿⣿⣿⣶⣌⢻⣿⡇⠀⠀⡆⠱⡌⣣⣿⣿⣿⣇⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⢸⣿⣿⡌⠂⠀⢻⣿⡿⢛⣫⣭⣭⣭⣭⣿⣓⣌⣛⣥⣬⣵⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡘⠁⡄⠀⡇⡆⠀⣽⣿⣿⣿⣍⠻⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⢸⣿⣿⣄⣓⠀⠀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⡿⠟⣿⡿⢿⣿⣿⣿⣿⣶⣤⣀⣁⣁⠸⢛⣿⣿⣿⠿⢓⣸',
      '⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡗⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠉⠉⠉⠉⠻⠙⢷⢀⢌⠂⠻⣌⠂⠢⠙⢟⡻⣿⣿⣿⠿⠋⠀⣾⣿⣿⣷⣦⡍⠹',
      '⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⣼⣿⣿⣿⣿⣿⣿⡿⣿⡿⠁⠠⠤⠶⣒⣋⣥⣶⠷⢀⣤⠤⣌⣀⣉⠓⠀⠀⠀⠀⠀⡄⠀⠀⠈⢼⣿⣿⡿⠟⠋⠀⠀',
      '⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⠏⣴⣿⣿⠋⢹⣏⠇⠻⠇⠟⣁⡐⠒⠛⠛⢛⣋⣩⣤⠶⠛⣡⣴⣿⣿⣿⠏⡀⡀⢸⠀⠀⠁⠀⠀⢐⣿⠟⠁⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⠛⢛⣋⣥⠞⡫⢐⠁⠂⡸⠃⠀⠂⠠⣾⣿⣍⠛⠛⣛⣛⣭⣭⣴⣶⣾⣿⣿⣿⡿⠃⠀⠃⠇⠈⠀⢀⠀⠰⢀⣾⡇⠀⠀⠀⠀⢀⣬⣶',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⣦⣬⣀⣈⠀⠕⢚⣈⠀⢴⡾⠁⣦⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠉⠀⢠⠀⠀⠀⠀⢰⢸⠀⠀⣸⣿⣿⣶⣤⠀⢠⣾⣿⣿',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⢠⣿⣷⣄⠉⠉⢉⣉⡉⠁⠀⠀⠀⠀⢰⠀⠀⡄⠘⠀⠀⣦⠠⡈⠀⠀⣨⣿⣿⣿⡿⣡⣶⣶⣿⣿⡟',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀⠨⢿⣿⣗⠀⠀⣼⣿⣿⣿⣷⣦⣤⣠⡌⠀⣰⣠⣤⣺⣰⣿⣵⠃⠀⢨⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣧',
    }
    alpha.setup(dashboard.opts)
  end,
}
