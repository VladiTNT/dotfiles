-- ======= --
-- Keymaps --
-- ======= --

-- Open File Manager
vim.keymap.set('n', 'e', ':Ex<CR>')

-- Open Diagnostic from LSP --
vim.keymap.set('n', 'g', vim.diagnostic.open_float)