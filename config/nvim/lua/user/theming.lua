-- Set up the visual appearance
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

local custom_highlights = function(colors)
    -- dark --> bright, five steps
    -- dark --> text, nine steps
    local cursor_line_dark = colors.surface0

    local float_dark = colors.surface0
    local float_bright = colors.overlay2
    local float_text = colors.lavender

    local prompt_dark = colors.surface0
    local prompt_bright = colors.overlay2

    local preview_dark = colors.crust
    local preview_bright = colors.surface2

    local results_dark = colors.mantle
    local results_bright = colors.overlay0
    local selection_dark = colors.surface0

    return {
        CursorLine = { bg = cursor_line_dark },
        NormalFloat = { fg = float_text, bg = float_dark }, -- Normal text in floating windows.
        Pmenu = { fg = float_text, bg = float_dark }, -- Popup menu: normal item.
        -- Unchanged:
        -- PmenuSel
        -- PmenuSbar
        -- PmenuThumb

        -- Telescope highlights
        TelescopePromptNormal = { bg = prompt_dark },
        TelescopePromptBorder = { fg = prompt_dark, bg = prompt_dark },
        TelescopePromptTitle = { fg = prompt_dark, bg = prompt_bright },
        TelescopePromptPrefix = { fg = prompt_bright },

        TelescopePreviewNormal = { bg = preview_dark },
        TelescopePreviewBorder = { fg = preview_dark, bg = preview_dark },
        TelescopePreviewTitle = { fg = preview_dark, bg = preview_bright },

        TelescopeResultsNormal = { bg = results_dark },
        TelescopeResultsBorder = { fg = results_dark, bg = results_dark },

        TelescopeSelection = { bg = selection_dark },
    }
end

catppuccin.setup({
    flavour = "macchiato", -- mocha, macchiato, frappe, latte
    custom_highlights = custom_highlights,
    styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
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
        lsp_trouble = true,
        treesitter = true,
        bufferline = true,
    },
})

catppuccin.load()
