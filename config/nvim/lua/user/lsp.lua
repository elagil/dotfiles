-- Enable language servers with the additional completion capabilities offered by coq_nvim
-- Set up COQ
vim.g.coq_settings = {
    auto_start = "shut-up" -- Start automatically
}

local coq = require("coq")

-- Set up LSP
local lspconfig = require("lspconfig")
local servers = {"pyright"}

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
    map("n", "<C-k>", vim.lsp.buf.signature_help, silent)
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, silent)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, silent)
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, silent)
    map("n", "<leader>D", vim.lsp.buf.type_definition, silent)
    map("n", "<F2>", vim.lsp.buf.rename, silent)
    map("n", "<leader>ca", vim.lsp.buf.code_action, silent)
    map("n", "gr", vim.lsp.buf.references, silent)
    map("n", "<leader>f", function()
        vim.lsp.buf.format {
            async = true
        }
    end, silent)
end

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach
    }))
end

-- Global configuration for diagnostic
vim.diagnostic.config {
  underline = true,
  virtual_text = true,
  signs = false,
  severity_sort = true,
}

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
