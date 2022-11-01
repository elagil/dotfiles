local M = {}

-- Set up null-ls for fixing/linting
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

M.lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls" -- Use only null-ls for formatting
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local format_on_save = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- neovim 0.8
                vim.lsp.buf.format({ bufnr = bufnr })
                -- neovim 0.7
                -- vim.lsp.buf.formatting_sync()
            end,
        })
    end
end

null_ls.setup({
    sources = {
        -- Python
        diagnostics.pylint.with({ -- Pylint
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        }),
        formatting.black.with({ extra_args = { "--fast" } }), -- Black Python formatter
        formatting.reorder_python_imports, -- Reordering of Python imports
        diagnostics.pyproject_flake8,

        -- LUA
        formatting.stylua, -- LUA styling

        -- General
        diagnostics.codespell, -- Finds common spelling errors
    },
    on_attach = format_on_save, -- Automatic formatting
})

return M
