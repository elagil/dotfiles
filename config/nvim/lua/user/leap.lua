local status_ok, leap = pcall(require, "leap")
if not status_ok then
    return
end

leap.add_default_mappings()

local map = vim.keymap.set
local silent = { silent = true }

-- Bidirectional search
map("n", ";", function()
    local current_window = vim.fn.win_getid()
    leap.leap({ target_windows = { current_window } })
end, silent)

-- Custom settings
leap.opts.special_keys = {
    repeat_search = "<tab>",
    next_phase_one_target = "<tab>",
    next_target = { "<tab>", ";" },
    prev_target = { "<s-tab>", "," },
    next_group = "<space>",
    prev_group = "<s-space>",
    multi_accept = "<enter>",
    multi_revert = "<backspace>",
}
