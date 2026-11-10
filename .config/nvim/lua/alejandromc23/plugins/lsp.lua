-- LSP servers (installed with Mason, enabled with the native vim.lsp.enable)
--
-- Per-server settings live in after/lsp/<server>.lua (native vim.lsp.config,
-- Neovim >= 0.11). nvim-lspconfig only provides the default server definitions.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", version = "^2", opts = {} },
      { "mason-org/mason-lspconfig.nvim", version = "^2" },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Completion capabilities for every server
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        float = { source = "if_many" },
      })

      -- Installs the servers and calls vim.lsp.enable() for each one of them
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua Language Server
          "ts_ls", -- TypeScript Language Server
          "pyright", -- Python Language Server
          "rust_analyzer", -- Rust Language Server
          "clangd", -- C/C++ Language Server
        },
        automatic_enable = true,
      })
    end,
  },

  { -- Formatters / linters that are not language servers
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    opts = {
      ensure_installed = { "stylua", "prettierd", "prettier" },
      run_on_start = true,
      auto_update = false,
    },
    config = function(_, opts)
      local mti = require("mason-tool-installer")
      mti.setup(opts)
      -- The plugin hooks VimEnter, which already fired when loading on VeryLazy
      mti.run_on_start()
    end,
  },
}
