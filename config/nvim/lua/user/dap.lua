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

local execute_if_dap_active = function(fn)
    if dap.session() == nil then
        return
    else
        fn()
    end
end

dapui.setup({
    floating = require("user/options").float_config,
    controls = {
        -- Requires Neovim 0.8
        enabled = true,
        -- Display controls in this element
        element = "scopes",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
        },
    },
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
})

local signs = {
    DapBreakpoint = "●",
    DapBreakpointCondition = "●",
    DapLogPoint = "◆",
}

for name, icon in pairs(signs) do
    vim.fn.sign_define(name, { text = icon, texthl = name, linehl = "", numhl = "" })
end

dap_python.setup("~/.virtualenvs/debugpy/bin/python")

table.insert(dap.configurations.python, {
    type = "python",
    request = "launch",
    name = "Launch current Python file",
    program = "${file}",
})

-- Bindings
local map = vim.keymap.set
local silent = { silent = true }

map("n", "<F5>", dap.continue, silent)
map("n", "<leader>b", dap.toggle_breakpoint, silent)
map("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, silent)
map("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, silent)
map("n", "<Leader>dl", dap.run_last, silent)
map("n", "<leader>ds", function() dapui.toggle(1) end, silent)
map("n", "<leader>dt", function() dapui.toggle(2) end, silent)
map("n", "<leader>e", function()
    execute_if_dap_active(dapui.eval)
end, silent)
map("n", "<F6>", dap.terminate, silent)
map("n", "<F7>", dap.step_over, silent)
map("n", "<F8>", dap.step_into, silent)
map("n", "<F9>", dap.step_out, silent)

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
