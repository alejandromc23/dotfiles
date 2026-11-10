-- Completion, treesitter and formatting

-- prettier only runs when the project opted in (config file or "prettier" key in package.json)
local function has_prettier_config(_, ctx)
  local markers = {
    ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml", ".prettierrc.json5",
    ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.mjs", ".prettierrc.toml",
    "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs",
  }
  if vim.fs.root(ctx.dirname, markers) then
    return true
  end
  local pkg = vim.fs.find("package.json", { path = ctx.dirname, upward = true })[1]
  if not pkg then
    return false
  end
  local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg), "\n"))
  return ok and type(data) == "table" and data.prettier ~= nil
end

local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          -- Navigate between completion items
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),

          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end,
  },

  { -- Highlight, edit, and navigate code (main branch: parsers need the tree-sitter CLI + a C compiler)
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})

      local ensure_installed = {
        "bash", "c", "css", "diff", "dockerfile", "gitcommit", "go", "html", "javascript", "jsdoc",
        "json", "lua", "luadoc", "markdown", "markdown_inline", "python", "query", "regex", "rust",
        "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
      }

      -- Install missing parsers asynchronously (the main branch has no `auto_install`)
      local function missing(langs)
        local installed = ts.get_installed("parsers")
        return vim.tbl_filter(function(lang)
          return not vim.list_contains(installed, lang)
        end, langs)
      end

      local to_install = missing(ensure_installed)
      if #to_install > 0 and vim.fn.executable("tree-sitter") == 1 then
        ts.install(to_install)
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("alejandromc23_treesitter", { clear = true }),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match) or event.match
          if pcall(vim.treesitter.start, event.buf, lang) then
            return
          end
          -- Parser missing: install it on the fly (like the old `auto_install = true`) and retry
          if vim.fn.executable("tree-sitter") == 1 and vim.list_contains(ts.get_available(), lang) then
            ts.install({ lang }):await(function()
              if vim.api.nvim_buf_is_valid(event.buf) then
                pcall(vim.treesitter.start, event.buf, lang)
              end
            end)
          end
        end,
      })
    end,
  },

  { -- Format on save
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo", "Format" },
    init = function()
      -- :FormatToggle  -> toggle format-on-save globally
      -- :FormatToggle! -> toggle it only for the current buffer
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        if args.bang then
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          vim.notify("Format on save " .. (vim.b.disable_autoformat and "disabled" or "enabled") .. " for this buffer")
        else
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          vim.notify("Format on save " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
        end
      end, { bang = true, desc = "Toggle format on save" })
    end,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        vue = prettier,
        json = prettier,
        jsonc = prettier,
        css = prettier,
        scss = prettier,
        html = prettier,
        markdown = prettier,
        yaml = prettier,
        python = { "ruff_format", "black", stop_after_first = true },
        rust = { "rustfmt" },
        go = { "gofmt" },
        sh = { "shfmt" },
      },
      formatters = {
        prettier = { condition = has_prettier_config },
        prettierd = { condition = has_prettier_config },
      },
      -- Only runs the formatters configured above (never the LSP) so unrelated
      -- projects are not reformatted. Use :Format for an explicit LSP-fallback format.
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 1000, lsp_format = "never" }
      end,
    },
    config = function(_, opts)
      require("conform").setup(opts)
      vim.api.nvim_create_user_command("Format", function(args)
        local range
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = { start = { args.line1, 0 }, ["end"] = { args.line2, end_line:len() } }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true, desc = "Format buffer (conform, LSP fallback)" })
    end,
  },
}
