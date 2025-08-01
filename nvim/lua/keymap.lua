vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', 'ciu', 'T_ct_')
vim.keymap.set('n', 'cu', 'ct_')
vim.keymap.set('n', 'diu', 'T_dt_')
vim.keymap.set('n', 'du', 'dt_')
vim.keymap.set('n', 'cid', 'T-ct-')
vim.keymap.set('n', 'cd', 'ct-')
vim.keymap.set('n', 'did', 'T-dt-')
vim.keymap.set('n', '<leader>ep', 'viwp')
vim.keymap.set('n', '<leader>eft', ':se filetype=twig<cr>')
vim.keymap.set('n', '<leader>efh', ':se filetype=html<cr>')

vim.cmd [[cab cr !drush cr<cr>]]
vim.cmd [[cab xd !xdebug toggle<cr>]]
-- Other keymaps
vim.keymap.set('i', '<C-]>', '<Esc>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Terminal
vim.keymap.set('n', '<leader>tT', '<C-w>v:terminal<CR>i')
vim.keymap.set('n', '<leader>tt', '<C-w>s:terminal<CR>i')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Cockblock
vim.keymap.set('i', '<left>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('i', '<left>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
