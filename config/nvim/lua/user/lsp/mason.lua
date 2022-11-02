-- Set up mason for LSP installation
local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup()
