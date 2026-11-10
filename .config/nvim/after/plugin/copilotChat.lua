-- CopilotChat is configured in lua/alejandromc23/plugins/ai.lua

vim.api.nvim_set_keymap("n", "<C-p>", ":CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Toggle CopilotChat" })
