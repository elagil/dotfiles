local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

local custom_highlights = function(colors)
    -- dark --> bright, five steps
    -- dark --> text, nine steps
    -- local cursor_line = colors.surface0

    local float_bg = colors.surface0
    local float_sel = colors.surface1
    local float_scroll_bar = float_bg
    local float_scroll_thumb = colors.surface2
    local float_text_dark = colors.overlay1
    local float_text_mid = colors.subtext0
    local float_text = colors.text
    local float_accent = colors.blue

    local prompt_dark = colors.surface0
    local prompt_bright = colors.overlay2

    local preview_dark = colors.crust
    local preview_bright = colors.surface2

    local results_dark = colors.mantle
    local results_bright = colors.overlay0
    local selection_dark = colors.surface0

    return {
        -- CursorLine = { bg = cursor_line },

        -- Float settings
        NormalFloat = { fg = float_text, bg = float_bg }, -- Normal text in floating windows.
        Pmenu = { fg = float_text, bg = float_bg }, -- Popup menu: normal item.
        PmenuSel = { bg = float_sel, style = { "bold" } }, -- Popup menu: selected item.
        PmenuSbar = { bg = float_scroll_bar }, -- Popup menu: scrollbar.
        PmenuThumb = { bg = float_scroll_thumb }, -- Popup menu: Thumb of the scrollbar.

        -- nvim-cmp float settings
        CmpItemAbbr = { fg = float_text_mid }, -- Highlight group for unmatched characters of each completion field.
        CmpItemAbbrDeprecated = { fg = float_text_dark, style = { "strikethrough" } }, -- Highlight group for unmatched characters of each deprecated completion field.
        CmpItemKind = { fg = float_accent }, -- Highlight group for the kind of the field.
        CmpItemMenu = { fg = float_text }, -- The menu field's highlight group.
        CmpItemAbbrMatch = { fg = float_text, style = { "bold" } }, -- Highlight group for matched characters of each completion field.
        CmpItemAbbrMatchFuzzy = { fg = float_text, style = { "bold" } }, -- Highlight group for fuzzy-matched characters of each completion field.

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

        -- visual-multi
        VM_Mono_hl = { fg = colors.lavender, bg = colors.mantle }, -- the highlight in cursor mode
        -- VM_Extend_hl -- in extend mode (the selections)
        VM_Cursor_hl = { fg = colors.rosewater, bg = colors.blue }, -- in extend mode (the cursors)
        -- VM_Insert_hl -- in insert mode (the virtual cursors
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
        neotree = true,
    },
})

catppuccin.load()
