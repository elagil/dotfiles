-- Telescope search utility
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local map = vim.keymap.set

map("n", "<c-t>", function()
	builtin.find_files({ hidden = true })
end, silent)
map("n", "<c-g>", builtin.git_files, silent)
map("n", "<c-a>", builtin.oldfiles, silent)
map("n", "<c-f>", builtin.live_grep, silent)
map("n", "<leader>fb", builtin.buffers, silent)
map("n", "<leader>fh", builtin.help_tags, silent)
map("n", "<leader>fd", function()
	builtin.diagnostics({ bufnr = 0 })
end, silent)
map("n", "<leader>fD", builtin.diagnostics, silent)
map("n", "<leader>fk", builtin.keymaps, silent)
map("n", "<F12>", builtin.lsp_definitions, silent)
map("n", "<F24>", builtin.lsp_references, silent) -- <F24> == <S-F12>

telescope.setup({
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<c-Down>"] = actions.move_selection_next,
				["<c-Up>"] = actions.move_selection_previous,
			},
		},
	},
})

telescope.load_extension("fzf")
