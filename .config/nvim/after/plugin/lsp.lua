-- Servers, Mason and completion are configured in lua/alejandromc23/plugins/lsp.lua
-- and lua/alejandromc23/plugins/coding.lua. Per-server settings: after/lsp/<server>.lua

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', '<leader>vws', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
    vim.keymap.set('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    -- vim.diagnostic.goto_next/goto_prev are deprecated (removed in 0.13); jump() does the same
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>', opts)
    vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

  end,
})
