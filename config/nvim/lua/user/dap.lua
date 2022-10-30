-- DAP setup
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    return
end

local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
    return
end

dapui.setup()
local sign = vim.fn.sign_define
local map = vim.keymap.set

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

-- Automatic open/close of debug UI
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     dapui.close()
-- end

dap_python.setup("~/.virtualenvs/debugpy/bin/python")

-- Bindings
map("n", "<F5>", dap.continue, silent)
map("n", "<F6>", dap.terminate, silent)
map("n", "<F7>", dap.step_over, silent)
map("n", "<F8>", dap.step_into, silent)
map("n", "<F9>", dap.step_out, silent)
map("n", "<F2>", dapui.eval, silent)
map("n", "<leader>b", dap.toggle_breakpoint, silent)
map("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, silent)
map("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, silent)
map("n", "<Leader>dl", dap.run_last, silent)
map("n", "<leader>du", dapui.toggle, silent)
