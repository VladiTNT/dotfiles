-----------------------------
-- My NeoVim Configuration --
-----------------------------

---------------------
-- General Options --
---------------------

-- Line Number --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Tabs --
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Cursor --
vim.opt.scrolloff = 8
vim.opt.cursorline = true

-- Window Split --
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard --
vim.opt.clipboard = "unnamedplus"

-- Mouse --
vim.opt.mouse = "a"

-- UI --
vim.opt.showmode = false
vim.opt.pumheight = 5
vim.opt.pumborder = 'rounded'

-- Colors --
vim.opt.termguicolors = true

-- Text Wrapping --
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Searching --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- System --
vim.opt.undofile = true
vim.opt.updatetime = 300

-- AutoComplete --
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.autocomplete = true

-------------
-- KeyMaps --
-------------

-- Open Diagnostic from LSP --
vim.keymap.set('n', 'g', vim.diagnostic.open_float)

-- Open File Manager
vim.keymap.set('n', 'e', ':Ex<CR>')

-- Plugins --
vim.pack.add({
    -- Dependencies --
    'https://github.com/nvim-tree/nvim-web-devicons',

    -- Catppuccin Theme --
    'https://github.com/catppuccin/nvim',
    -- Lsp Config --
    'https://github.com/neovim/nvim-lspconfig',
    -- Lualine --
    'https://github.com/nvim-lualine/lualine.nvim',
})

-- Plugin Configuration --

-- Catppuccin Setup --
require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = true, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    color_overrides = {},
    custom_highlights = {},
    auto_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

-- Enable Catppuccin --
vim.cmd("colorscheme catppuccin-nvim")

-- Lualine Setup --
require('lualine').setup()

-----------------------
-- LSP Configuration --
-----------------------

-- GoPls Config --
vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go' },
})

-- Enable LSPs --
vim.lsp.enable({ 'gopls' })

-- AutoComplete from LSP Callback --
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function (ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
    end,
})