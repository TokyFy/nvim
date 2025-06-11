-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- For Neotree
vim.keymap.set('n', '<C-n>', '<cmd> Neotree toggle <CR>', opts)

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>' , opts)
vim.keymap.set('n', '<leader>fg', '<cmd> Telescope live_grep <CR>' , opts)

