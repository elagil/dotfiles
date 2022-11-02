-- Shows problems in a separate panel
local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
    return
end

diagnostics = require("user/lsp/diagnostics")

trouble.setup({
    mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    auto_open = false, -- automatically open the list if there are diagnostics
    auto_close = false, -- automatically close the list if there are no diagnostics
    padding = false, -- adds an extra new line on top of the list
    signs = {
        error = diagnostics.symbols.Error,
        warning = diagnostics.symbols.Warn,
        hint = diagnostics.symbols.Hint,
        information = diagnostics.symbols.Info,
        other = diagnostics.symbols.Other,
    },
})

-- Mappings
local silent = { silent = true }
local map = vim.keymap.set

map("n", "<leader>jj", "<cmd>TroubleToggle<cr>", silent)
map("n", "<leader>jD", "<cmd>TroubleToggle workspace_diagnostics<cr>", silent)
map("n", "<leader>jd", "<cmd>TroubleToggle document_diagnostics<cr>", silent)
map("n", "<leader>jl", "<cmd>TroubleToggle loclist<cr>", silent)
map("n", "<leader>jq", "<cmd>TroubleToggle quickfix<cr>", silent)
map("n", "<F24>", "<cmd>TroubleToggle lsp_references<cr>", silent)
