-- Set up null-ls for fixing/linting
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- Automatic formatting callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local auto_format = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.formatting_sync()
			end,
		})
	end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		-- Python
		diagnostics.pylint.with({ -- Pylint
			diagnostics_postprocess = function(diagnostic)
				diagnostic.code = diagnostic.message_id
			end,
		}),
		formatting.black, -- Black Python formatter
		formatting.reorder_python_imports, -- Reordering of Python imports
		diagnostics.pyproject_flake8,

		-- LUA
		formatting.stylua, -- LUA styling

		-- Generic
		completion.spell, -- Spell check
	},
	on_attach = auto_format,
})
