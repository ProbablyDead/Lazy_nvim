-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local s = vim.keymap.set

s("n", "<leader>e", vim.cmd.Ex)

s("v", "J", ":m '>+1<CR>gv=gv")
s("v", "K", ":m '<-2<CR>gv=gv")

s("n", "J", "mzJ`z")
s("n", "J", "mzJ`z")

s("n", "<C-d>", "<C-d>zz")
s("n", "<C-u>", "<C-u>zz")

s("n", "n", "nzzzv")
s("n", "N", "Nzzzv")

s("x", "<leader>p", '"_dP')

s("n", "<leader>y", '"+y')
s("v", "<leader>y", '"+y')
s("n", "<leader>Y", '"+Y')

-- Paning
s("n", "<C-s>", ":split<CR>")
s("n", "<C-h>", ":wincmd h<CR>")
s("n", "<C-j>", ":wincmd j<CR>")
s("n", "<C-k>", ":wincmd k<CR>")
s("n", "<C-l>", ":wincmd l<CR>")
