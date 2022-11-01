-- Set up the visual appearance
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavour = "macchiato", -- mocha, macchiato, frappe, latte
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		native_lsp = { -- Support for nvim-lsp
			enabled = true,
		},
		dap = { -- Support for nvim-dap
			enabled = true,
			enabled_ui = true, -- enable nvim-dap-ui
		},
		treesitter = false, -- FIXME: Disable for now, since no treesitter is available
	},
})

vim.api.nvim_command("colorscheme catppuccin")
