-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Leader Motions
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>c', '<cmd>bd<CR>', { desc = 'Close current Buffer' })

-- Window movement
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize
vim.keymap.set('n', '<C-Up>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<C-Down>', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>')

-- term mode i think
vim.keymap.set('n', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('n', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('n', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('n', '<C-l>', '<C-\\><C-N><C-w>l')

-- Tree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- split

vim.keymap.set('n', '|', '<cmd>vsplit<CR>')
vim.keymap.set('n', '-', '<cmd>split<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>O', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Ufo Code Folding
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
