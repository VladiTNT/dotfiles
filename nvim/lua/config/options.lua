-- General Options --

-- Line Numeber --
vim.o.number = true
vim.o.relativenumber = true

-- Tab Size
local tabsize = 2

vim.o.tabstop = tabsize
vim.o.softtabstop = tabsize
vim.o.shiftwidth = tabsize
vim.o.expandtab = true

-- Indentation --

vim.o.autoindent = true
vim.o.smartindent = true

-- Quality of Life --

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.undofile = true
vim.o.updatetime = 300

-- Text Wrapping & Line Breaks --

vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

-- Cursor --

vim.o.scrolloff = 8
vim.o.cursorline = true

-- Split Behavior --

vim.o.splitbelow = true
vim.o.splitright = true

-- Clipboard & Mouse --

vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"

-- Terminal --

vim.o.termguicolors = true

-- Auto Complete --

vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.showcmd = true
vim.o.showmode = false

-- File Manager
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true