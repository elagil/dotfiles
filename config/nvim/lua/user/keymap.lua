-- The keymap
local silent = {silent = true}
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
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local diag_float = {border = "single"}
map("n", "[d", function() vim.diagnostic.goto_prev({float = diag_float}) end, silent)
map("n", "]d", function() vim.diagnostic.goto_next({float = diag_float}) end, silent)
map("n", "<c-k>", function() vim.diagnostic.open_float(diag_float) end, silent)

-- Quitting
map("n", "<leader>q", "<cmd>qa<cr>", silent)

-- Better paste: does not yank while pasting in visual mode
map("v", "p", '"_dP', silent)

-- Stay in indent mode after indenting
map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)

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

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<c-t>", builtin.find_files, silent)
map("n", "<c-g>", builtin.git_files, silent)
map("n", "<c-a>", builtin.oldfiles, silent)
map("n", "<c-f>", builtin.live_grep, silent)
map("n", "<leader>fb", builtin.buffers, silent)
map("n", "<leader>fh", builtin.help_tags, silent)
map("n", "<leader>fd", function() builtin.diagnostics({bufnr=0}) end, silent)
map("n", "<leader>fD", builtin.diagnostics, silent)
map("n", "<leader>fk", builtin.keymaps, silent)
map("n", "<F12>", builtin.lsp_definitions, silent)
map("n", "<F24>", builtin.lsp_references, silent) -- <F24> == <S-F12>

-- NvimTree
map("n", "<c-b>", ":NvimTreeToggle<CR>", silent)

-- DAP
local dap = require("dap")
local dapui = require("dapui")

map("n", "<F5>", dap.continue, silent)
map("n", "<F6>", dap.terminate, silent)
map("n", "<F7>", dap.step_over, silent)
map("n", "<F8>", dap.step_into, silent)
map("n", "<F9>", dap.step_out, silent)
map("n", "<F2>", dapui.eval, silent)
map("n", "<leader>b", dap.toggle_breakpoint, silent)
map("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, silent)
map("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, silent)
map("n", "<Leader>dl", dap.run_last, silent)
map("n", "<leader>du", dapui.toggle, silent)
