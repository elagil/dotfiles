local status_ok, leap = pcall(require, "leap")
if not status_ok then
    return
end

leap.add_default_mappings()

-- Custom settings
leap.opts.special_keys = {
    next_phase_one_target = "<tab>",
    next_target = { "<tab>", ";" },
    prev_target = { "<s-tab>", "," },
    next_group = "<bs>",
    prev_group = "<s-bs>",
    multi_accept = "<enter>",
    multi_revert = "<bs>",
}
