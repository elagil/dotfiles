-- Set up VIM diagnostics
M = {}
M.symbols = { Error = " ", Warn = " ", Hint = " ", Info = " ", Other = " " }
M.empty = { Error = "", Warn = "", Hint = "", Info = "", Other = "" }

for type, label in pairs(M.empty) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { icon = "", text = label, texthl = hl, numhl = hl })
end

local config = {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = require("user/options").float_config,
}

vim.diagnostic.config(config)
return M
