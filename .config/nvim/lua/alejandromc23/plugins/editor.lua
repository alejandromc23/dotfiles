-- File explorer, fuzzy finder, text editing helpers
return {
  { -- Buffer-based file explorer (replaces netrw)
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      skip_confirm_for_simple_edits = true,
      view_options = { show_hidden = true },
      keymaps = {
        -- Disabled inside oil buffers so the global <C-s> (save) and <C-p> (CopilotChat) keep working
        ["<C-s>"] = false,
        ["<C-p>"] = false,
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)

      -- netrw is disabled, but `:Ex` / `:Explore` (used by <leader>d) now open oil
      for _, name in ipairs({ "Ex", "Explore" }) do
        vim.api.nvim_create_user_command(name, function(cmd)
          require("oil").open(cmd.args ~= "" and cmd.args or nil)
        end, { nargs = "?", complete = "dir", desc = "Open oil file explorer" })
      end
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    -- Tracks master: the latest tag (0.1.8, 2024) still uses the removed nvim-treesitter master-branch API
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },

  -- Show edits tree history allowing happier undos
  { "mbbill/undotree", cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" } },

  -- Allows refactoring code and extracting to functions and vars
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true, -- loaded on first `require("refactoring")` from the keymaps
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },

  -- Plugin for showing diagnostics
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- Surround text objects (ys, cs, ds...)
  "tpope/vim-surround",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Rain!!
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },

  { -- LaTeX. Not lazy-loaded on filetype: VimTeX relies on its own ftdetect
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- Viewer options: One may configure the viewer either by specifying a built-in
      -- viewer method:
      vim.g.vimtex_view_method = "zathura"

      -- Or with a generic interface:
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

      -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
      -- strongly recommended, you probably don't need to configure anything. See
      -- ":help vimtex-compiler" for other backends.
    end,
  },
}
