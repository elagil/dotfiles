-- NVIM tree sidebar
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	open_on_tab = true,
    hijack_cursor = true,
	update_focused_file = {
        update_root = false,
		enable = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		group_empty = true,
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	view = {
		adaptive_size = true,
		side = "left",
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "o", action = "cd" },
				{ key = "<Right>", action = "edit" },
				{ key = "<Left>", action = "close_node" },
			},
		},
	},
})

-- Mapping
local map = vim.keymap.set
local silent = { silent = true }

map("n", "<c-b>", ":NvimTreeToggle<CR>", silent)
