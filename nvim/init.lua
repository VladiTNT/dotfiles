-- ======================= --
-- My NeoVim Configuration --
-- ======================= --

-- Config --
require('config.options')
require('config.keymaps')
require('config.diagnostic')
require('config.autocomplete')
require('config.pack')

-- Plugins --
require('plugins.catppuccin')
require('plugins.lualine')

-- Language Servers --
vim.lsp.enable({'gopls', 'clangd'})
