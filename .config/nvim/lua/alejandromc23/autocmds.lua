local function augroup(name)
  return vim.api.nvim_create_augroup("alejandromc23_" .. name, { clear = true })
end

-- Highlight yanked text for 100ms using the "Visual" highlight group
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    -- vim.hl replaced vim.highlight in Neovim 0.11
    local hl = vim.hl or vim.highlight
    hl.on_yank({ higroup = "Visual", timeout = 100 })
  end,
})

-- Show the cursorline only in the active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "FocusGained" }, {
  group = augroup("cursorline_active"),
  callback = function()
    vim.wo.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
  group = augroup("cursorline_inactive"),
  callback = function()
    vim.wo.cursorline = false
  end,
})
