-- Lualine setup
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lsp_diagnostics = require("user/lsp/diagnostics")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local shorten = function(str, length)
	length = length or 20
	local dots = 3

	local first_half_length = math.ceil((length - 3) / 2)
	local second_half_length = math.floor((length - 3) / 2)

	if string.len(str) > (length + dots) then
		return string.sub(str, 1, first_half_length) .. "..." .. string.sub(str, -second_half_length)
	else
		return str
	end
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = lsp_diagnostics.symbols.Error, warn = lsp_diagnostics.symbols.Warn },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}

local branch = {
	"branch",
	fmt = shorten,
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "packer" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "filename" },
		lualine_b = { branch },
		lualine_c = { diagnostics },
		lualine_x = { diff, "encoding", filetype },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
})
