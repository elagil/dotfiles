-- The keymap
local silent = { silent = true }
local map = vim.keymap.set
local cmd = vim.cmd
local g = vim.g

g.mapleader = " "

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, silent)
map("n", "]d", vim.diagnostic.goto_next, silent)
map("n", "<leader>k", vim.diagnostic.open_float, silent)

-- Quitting
map("n", "<leader>q", "<cmd>qa<cr>", silent)
map("n", "<leader>Q", "<cmd>qa!<cr>", silent)

-- Better paste: does not yank while pasting in visual mode
map("v", "p", '"_dP', silent)

-- Better indenting
map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)
map("n", "<", "<<", silent)
map("n", ">", ">>", silent)

-- Clear search highlights
map("n", "<leader><leader>", "<cmd>nohl<cr>", silent)

-- Save buffer
map("i", "<c-s>", "<esc><cmd>w<cr>a", silent)
map("n", "<leader>w", "<cmd>w<cr>", silent)

-- Yank to clipboard
map("v", "<c-c>", '"+y', silent)

-- Paste from yank register
map("n", "<leader>p", '"0p', silent)
map("n", "<leader>P", '"0P', silent)

-- Window movement
map("n", "<m-Left>", "<c-w>h", silent)
map("n", "<m-Right>", "<c-w>l", silent)
map("n", "<m-Up>", "<c-w>k", silent)
map("n", "<m-Down>", "<c-w>j", silent)
map("n", "<c-=>", "<c-=><", silent)
map("n", "<m-=>", "<cmd>vertical res +10<cr>", silent)
map("n", "<m-->", "<cmd>vertical res -10<cr>", silent)
map("n", "<m-[>", "<cmd>res +5<cr>", silent)
map("n", "<m-]>", "<cmd>res -5<cr>", silent)

-- Tabs
map("n", "<leader>tc", "<cmd>tabclose<cr>", silent)
map("n", "<leader>to", "<cmd>tabonly<cr>", silent)
map("n", "<c-Left>", "<cmd>tabpre<cr>", silent)
map("n", "<c-Right>", "<cmd>tabnext<cr>", silent)

-- NvimTree
map("n", "<c-b>", ":NvimTreeToggle<CR>", silent)
