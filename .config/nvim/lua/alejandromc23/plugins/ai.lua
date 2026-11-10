-- AI assistants
return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false, -- disable Copilot's default accept key (see after/plugin/copilot.lua)
          -- you can also disable others: accept_word=false, accept_line=false, etc.
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        html = true,
        javascript = true,
        typescript = true,
        ["*"] = true, -- or false if you prefer opt-in
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    cmd = {
      "CopilotChat", "CopilotChatOpen", "CopilotChatClose", "CopilotChatToggle", "CopilotChatStop",
      "CopilotChatReset", "CopilotChatSave", "CopilotChatLoad", "CopilotChatPrompts", "CopilotChatModels",
      "CopilotChatAgents", "CopilotChatExplain", "CopilotChatReview", "CopilotChatFix", "CopilotChatOptimize",
      "CopilotChatDocs", "CopilotChatTests", "CopilotChatCommit",
    },
    opts = {
      window = {
        position = "right", -- Position of the chat window
      },
    },
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      debug = true,
      provider = "copilot",
      auto_suggestions_provider = nil,
    },
    build = "make",
    dependencies = {
      "zbirenbaum/copilot.lua", -- Required for copilot provider
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      -- Optional:
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "azorng/goose.nvim",
    config = function()
      require("goose").setup({})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
        },
      },
    },
  },
}
