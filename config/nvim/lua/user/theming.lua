-- Set up the visual appearance
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

catppuccin.setup({
    flavour = "macchiato", -- mocha, macchiato, frappe, latte
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
        operators = {},
    },
    integrations = {
        native_lsp = { -- Support for nvim-lsp
            enabled = true,
        },
        dap = { -- Support for nvim-dap
            enabled = true,
            enabled_ui = true, -- enable nvim-dap-ui
        },
        -- treesitter = true, -- FIXME: Disable for now, since no treesitter is available
    },
})

vim.api.nvim_command("colorscheme catppuccin")
