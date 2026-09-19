-- ============================= --
-- Language Server Configuration --
-- ============================= --

-- Gopls Config --
vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go' },
})

-- Enable LSPs --
vim.lsp.enable({ 'gopls' })