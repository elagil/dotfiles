local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
    return
end

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neotree.setup({
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "diagnostics",
    },
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    source_selector = {
        winbar = true,
        statusline = true,
    },
    window = {
        mappings = {
            ["<Left>"] = "prev_source",
            ["<Right>"] = "next_source",
        },
    },
})

-- Mapping
local map = vim.keymap.set
local silent = { silent = true }

map("n", "<C-b>", ":Neotree reveal float<CR>", silent)
