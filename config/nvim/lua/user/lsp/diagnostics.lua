-- Set up VIM diagnostics
local symbols = { Error = "", Warn = "", Hint = "", Info = "" }
-- local empty = { Error = "", Warn = "", Hint = "", Info = "" }

local signs = symbols -- Can be `symbols` or `empty`

for type, label in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = label, texthl = hl, numhl = hl })
end

local config = {
	virtual_text = false,
	signs = signs,
	update_in_insert = false,
	underline = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)
