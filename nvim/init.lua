require("config.lazy")

-- Tabs/Spaces and leader
vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Switch buffer
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

vim.g.virtcolumn_char = "▕"
vim.cmd("set cc=80")

-- TODO:
-- terminal toggler
-- filenames at top
