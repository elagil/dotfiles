-- Neotest setup
local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
    return
end

require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
    },
})
