return {
  'olimorris/codecompanion.nvim',
  opts = {},
  cond = not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      adapters = {
        gemini = function()
          return require('codecompanion.adapters').extend('gemini', {
            env = {
              api_key = 'NVmnFlNMHZmV5xQXFKlxkSiFDBCc9-1kMaWGAWN',
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'gemini',
        },
        inline = {
          adapter = 'gemini',
        },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>we', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>ww', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>ee', ':vsplit ~/.config/nvim/init.lua<CR>', { desc = 'Edit init.lua' })
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
