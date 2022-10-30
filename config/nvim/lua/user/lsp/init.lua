-- Set up LSP
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local servers = {"pyright", "sumneko_lua"}

require("user/lsp/completion") -- Autocompletion
require("user/lsp/null-ls") -- Linter/fixer engine

local silent = {silent = true}
local map = vim.keymap.set

-- Mappings for VIM LSP
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    map("n", "gd", vim.lsp.buf.definition, silent)
    map("n", "gD", vim.lsp.buf.declaration, silent)
    map("n", "K", vim.lsp.buf.hover, silent)
    map("n", "gi", vim.lsp.buf.implementation, silent)
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, silent)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, silent)
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, silent)
    map("n", "<leader>D", vim.lsp.buf.type_definition, silent)
    map("n", "<F2>", vim.lsp.buf.rename, silent)
    map("n", "<leader>ca", vim.lsp.buf.code_action, silent)
end

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end
