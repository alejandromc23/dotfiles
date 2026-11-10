-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
--
-- NOTE: Neovim 0.12 ships a native package manager (`vim.pack`). lazy.nvim is
-- kept for now because this config still has to run on 0.11, and because
-- several plugins need build steps (`make`) and lazy-loading that lazy.nvim
-- handles out of the box. Revisit once every machine runs >= 0.12.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Every file in lua/alejandromc23/plugins/ returns a list of plugin specs
  spec = { { import = "alejandromc23.plugins" } },
  install = { colorscheme = { "onedark" } },
  checker = { enabled = false },
  change_detection = { notify = false },
  rocks = { enabled = false },
  performance = {
    rtp = {
      -- netrw is replaced by oil.nvim
      disabled_plugins = { "gzip", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})
