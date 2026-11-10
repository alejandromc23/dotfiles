-- Theme, statusline, bufferline and other visual plugins

-- Relative path shortened to `first/…/parent/file` when it gets deep.
local function pretty_path()
  if vim.bo.filetype == "oil" then
    local ok, oil = pcall(require, "oil")
    local dir = ok and oil.get_current_dir() or nil
    return dir and ("oil " .. vim.fn.fnamemodify(dir, ":~")) or "oil"
  end

  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then
    return "[No Name]"
  end

  local path = vim.fn.fnamemodify(name, ":~:.")
  local parts = vim.split(path, "/", { plain = true })
  if #parts > 3 then
    path = table.concat({ parts[1], "…", parts[#parts - 1], parts[#parts] }, "/")
  end

  if vim.bo.modified then
    path = path .. " [+]"
  elseif vim.bo.readonly or not vim.bo.modifiable then
    path = path .. " [RO]"
  end
  return path
end

-- Feed lualine's `diff` component from mini.diff instead of gitsigns
local function minidiff_source()
  local summary = vim.b.minidiff_summary
  if summary then
    return { added = summary.add, modified = summary.change, removed = summary.delete }
  end
end

return {
  { -- Theme inspired by Atom
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        -- Main options --
        style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = true,
        -- toggle theme style ---
        toggle_style_key = "<leader>ct", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "light" }, -- List of styles to toggle between
      })
      vim.cmd.colorscheme("onedark")
    end,
  },

  { "xiyaowong/transparent.nvim", lazy = false },

  { -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = {}, winbar = {} },
        ignore_focus = {},
        always_divide_middle = true,
        -- Single statusline for all windows (matches `laststatus = 3`)
        globalstatus = true,
        refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", { "diff", source = minidiff_source } },
        lualine_c = { pretty_path },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { pretty_path },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "oil", "trouble", "fugitive", "lazy", "mason" },
    },
  },

  { -- Bufferline. Nerd fonts should be installed in order to visualize icons correct
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {},
  },

  -- Indentation guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", event = { "BufReadPost", "BufNewFile" }, opts = {} },

  { -- Clean, non-blocking notifications for vim.notify (incl. LSP progress)
    "nvim-mini/mini.notify",
    event = "VeryLazy",
    config = function()
      local notify = require("mini.notify")
      notify.setup({
        window = { winblend = 0 },
      })
      vim.notify = notify.make_notify()
    end,
  },

  -- Show HEX / RGB / HSL colors inline
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPre", "BufNewFile" },
    opts = { render = "background", enable_tailwind = false },
  },

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
}
