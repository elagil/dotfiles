local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    direction = "tab",
    shade_terminals = false,
})

-- Mappings
local silent = { silent = true }
local map = vim.keymap.set
local map_for_buf = vim.api.nvim_buf_set_keymap

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        map_for_buf(term.bufnr, "n", "q", "<cmd>close<CR>", silent)
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local function lazygit_toggle()
    lazygit:toggle()
end

map("n", "<leader>tg", lazygit_toggle, silent)
