-- Byte-compile and cache Lua modules for faster startup (Neovim >= 0.9)
if vim.loader then
  vim.loader.enable()
end

require("alejandromc23")
