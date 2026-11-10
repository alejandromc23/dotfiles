-- copilot.lua is configured in lua/alejandromc23/plugins/ai.lua

-- Use Tab to accept Copilot when visible; otherwise insert a Tab
vim.keymap.set("i", "<Tab>", function()
  local ok, s = pcall(require, "copilot.suggestion")
  if ok and s.is_visible() then
    s.accept()
    return ""
  end
  return "\t"
end, { expr = true, silent = true })
