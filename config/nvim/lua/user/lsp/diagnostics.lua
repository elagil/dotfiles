-- Set up VIM diagnostics
M = {}
M.symbols = { Error = "", Warn = "", Hint = "", Info = "", Other = "" }
empty = { Error = "", Warn = "", Hint = "", Info = "" }

for type, label in pairs(empty) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = label, texthl = hl, numhl = hl })
end

local config = {
    virtual_text = false,
    signs = true,
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
return M
