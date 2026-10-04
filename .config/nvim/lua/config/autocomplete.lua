-- ===================== --
-- AutoComplete Settings --
-- ===================== --

-- Options --
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.autocomplete = true

-- AutoComplete from LSP Callback --
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function (ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
    end,
})