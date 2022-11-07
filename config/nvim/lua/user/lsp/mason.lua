-- Set up mason for LSP installation
local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status_ok then
    return
end

mason.setup()
mason_lspconfig.setup({automatic_installation = true})
