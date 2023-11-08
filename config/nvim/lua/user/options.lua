local M = {}
local opt = vim.opt

-- General
opt.mouse = "a"   -- Allows the use of a mouse
opt.hidden = true -- Do not discard hidden buffers/terminals

-- Editor appearance
opt.number = true      -- Line numbering
opt.relativenumber = true
opt.cmdheight = 1      -- Space for the command line of VIM
opt.signcolumn = "yes" -- Show the sign column
opt.cursorline = true  -- A line, where the cursor is

-- Editor behaviour
opt.wrap = true                     -- Wrap lines
opt.scrolloff = 8                   -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8               -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
opt.iskeyword:append("-")           -- treats words with `-` as single words

-- Backup and undo
opt.backup = false   -- No backup file
opt.swapfile = false -- No swap file
opt.undofile = true  -- Persistent undo

-- Searches
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Moves the highlight incrementally, while typing
opt.magic = true      -- Magic for regex, changes escaping rules
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true  -- Case-sensitive search, if at least one uppercase letter is used

-- Tabs
opt.tabstop = 4      -- Insert 4 spaces for a tab
opt.shiftwidth = 4   -- Number of spaces per indentation
opt.expandtab = true -- Expand tabs to spaces

-- Exported options
M.float_config = { -- Default float configuration
    border = "none",
    focusable = false,
    style = "minimal",
    source = "always",
    header = "",
    prefix = "",
}
return M
