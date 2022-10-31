-- Shows problems in a separate panel
local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({
	mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	auto_open = false, -- automatically open the list if there are diagnostics
	auto_close = false, -- automatically close the list if there are no diagnostics
	padding = false, -- adds an extra new line on top of the list
	use_diagnostic_signs = true, -- enabling this will use the signs defined in the lsp client
})

-- Mappings
local silent = { silent = true }
local map = vim.keymap.set

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", silent)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", silent)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", silent)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", silent)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", silent)
map("n", "<F24>", "<cmd>TroubleToggle lsp_references<cr>", silent)
