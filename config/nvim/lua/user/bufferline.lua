-- Bufferline setup
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

local theme_status_ok, _ = pcall(require, "catppuccin")
if not theme_status_ok then
    return
end

bufferline.setup({
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
        mode = "tabs",
        show_buffer_icons = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Tree",
                highlight = "Directory",
                text_align = "left",
                padding = 1,
            },
        },
    },
})
