-- ======================== --
-- Diagnostic Configuration --
-- ======================== --

vim.diagnostic.config({
  update_in_insert = true,
  severity_sort = true,
  
  virtual_text = {
    prefix = '■',
    severity = { min = vim.diagnostic.severity.WARN },
  },
  
  signs = true,
  
  underline = true,
  
  float = {
    focused = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
