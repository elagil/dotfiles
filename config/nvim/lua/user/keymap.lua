local silent = {
    silent = true
}
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

-- Yank/paste
map("v", "<C-c>", '"+y', silent)     -- Yank to system clipboard

map("v", "p", '"_dP', silent)        -- Paste in visual mode without yanking selection
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

-- VSCode specific
if vim.g.vscode then
    -- empty
end

-- Non-VScode actions
if not vim.g.vscode then
    -- Quitting
    map("n", "<leader>q", "<cmd>qa<cr>", silent)
    map("n", "<leader>Q", "<cmd>qa!<cr>", silent)
end
