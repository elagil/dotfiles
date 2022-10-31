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
map("n", "<leader>fc", builtin.commands, silent)
map("n", "<leader>fh", builtin.help_tags, silent)
map("n", "<leader>fd", function()
	builtin.diagnostics({ bufnr = 0 })
end, silent)
map("n", "<leader>fD", builtin.diagnostics, silent)
map("n", "<leader>fk", builtin.keymaps, silent)
map("n", "<F12>", builtin.lsp_definitions, silent)
map("n", "<leader>fr", builtin.lsp_references, silent)
map("n", "<leader>fi", builtin.lsp_incoming_calls, silent)
map("n", "<leader>fo", builtin.lsp_outgoing_calls, silent)

telescope.setup({
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<c-Down>"] = actions.cycle_history_next,
				["<c-Up>"] = actions.cycle_history_prev,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
			},
		},
	},
})

telescope.load_extension("fzf")
