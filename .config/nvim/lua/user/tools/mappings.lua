local M = {}

local opts = {
    silent = true
}
local map = vim.keymap.set

M.map = function(mode, lhs, rhs, desc)
    local merged_opts = opts;
    merged_opts.insert(desc);
    map(mode, lhs, rhs, merged_opts);
end

return M
