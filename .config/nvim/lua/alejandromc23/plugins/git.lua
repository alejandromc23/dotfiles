-- Git related plugins
return {
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" }, event = "VeryLazy" },

  { -- Git hunks in the sign column + hunk navigation / staging
    "nvim-mini/mini.diff",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.diff").setup({
        view = {
          style = "sign",
          signs = { add = "▎", change = "▎", delete = "_" },
        },
        mappings = {
          -- Apply / reset hunks (operator + textobject)
          apply = "gh",
          reset = "gH",
          textobject = "gh",
          -- Jump between hunks
          goto_first = "[C",
          goto_prev = "[c",
          goto_next = "]c",
          goto_last = "]C",
        },
      })
    end,
  },
}
