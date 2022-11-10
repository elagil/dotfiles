-- Tree sidebar
local status_ok, tree = pcall(require, "neo-tree")
if not status_ok then
    return
end

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

tree.setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    source_selector = {
        winbar = true,
        statusline = true,
    },
})

-- Mapping
local map = vim.keymap.set
local silent = { silent = true }

map("n", "<c-b>", ":Neotree toggle<CR>", silent)
