local silent = { silent = true }
local map = vim.keymap.set
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

-- Changing directory to the current buffer
map("n", "<leader>cd", "<cmd>cd %:p:h<CR>:pwd<CR>", silent)

-- Quitting
map("n", "<leader>q", "<cmd>qa<cr>", silent)
map("n", "<leader>Q", "<cmd>qa!<cr>", silent)

-- Yank/paste
map("v", "p", '"_dP', silent) -- Paste in visual mode without yanking selection
map({ "n", "v" }, "<leader>y", '"+y', silent) -- Yank to system clipboard
map("n", "<leader>p", '"0p', silent) -- Paste from yank register
map("n", "<leader>P", '"0P', silent) -- Paste before from yank register

-- Better indenting
map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)
map("n", "<", "<<", silent)
map("n", ">", ">>", silent)

-- Clear search highlights
map("n", "<leader><leader>", "<cmd>nohl<cr>", silent)

-- Save buffer
map("i", "<C-s>", "<esc><cmd>w<cr>a", silent)
map("n", "<C-s>", "<cmd>w<cr>", silent)

-- Window and tab movement
-- Tabs
map("n", "<S-Left>", "<cmd>tabprevious<cr>", silent)
map("n", "<S-Right>", "<cmd>tabnext<cr>", silent)
map("n", "<leader>tc", "<cmd>tabclose<cr>", silent)
map("n", "<leader>to", "<cmd>tabonly<cr>", silent)

-- Window panes
map("n", "<C-Left>", "<C-w>h", silent)
map("n", "<C-Right>", "<C-w>l", silent)
map("n", "<C-Up>", "<C-w>k", silent)
map("n", "<C-Down>", "<C-w>j", silent)

-- Resizing window panes
map("n", "<C-=>", "<C-=><", silent)
map("n", "<m-=>", "<cmd>vertical res +10<cr>", silent)
map("n", "<m-->", "<cmd>vertical res -10<cr>", silent)
map("n", "<m-[>", "<cmd>res +5<cr>", silent)
map("n", "<m-]>", "<cmd>res -5<cr>", silent)
