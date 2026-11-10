-- barbar.nvim is configured in lua/alejandromc23/plugins/ui.lua

vim.keymap.set('n', '<S-Left>', ':BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<S-Right>', ':BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<S-c>', ':BufferClose<CR>', { silent = true })
vim.keymap.set('n', '<S-r>', ':BufferMoveNext<CR>', { silent = true })
vim.keymap.set('n', '<S-l>', ':BufferMovePrevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>to', ':BufferOrderByDirectory<CR>', { silent = true })
vim.keymap.set('n', '<leader>td', ':BufferCloseBuffersLeft<CR>', { silent = true })
vim.keymap.set('n', '<leader>tf', ':BufferCloseBuffersRight<CR>', { silent = true })
vim.keymap.set('n', '<leader>th', ':BufferPick<CR>', { silent = true })
