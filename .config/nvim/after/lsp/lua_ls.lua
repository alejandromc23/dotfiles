-- Extends the lua_ls defaults shipped by nvim-lspconfig (see :help lsp-config)
return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognize 'vim' as a global variable
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}
