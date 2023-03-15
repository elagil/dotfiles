-- Load plugins first
require("user/plugins")

-- Setup and load plugins
require("user/options") -- General options
require("user/keymap") -- General keymap
require("user/leap") -- Movement within a buffer

if not vim.g.vscode then
    -- Do not load the following in VSCode neovim extension.
    require("user/theming") -- Apply visual settings
    require("user/neotree") -- Sidebar tree view
    require("user/diffview") -- Git diff and merge tool
    require("user/lualine") -- Status line
    require("user/bufferline") -- A line for buffer info
    require("user/gitlines") -- Git status on the side
    require("user/comment") -- Commenting tool
    require("user/toggleterm") -- Terminal toggling tool
    require("user/surround") -- Surround selections with text
    require("user/dap") -- DAP setup (debug services)
    require("user/neotest") -- Test interface
    require("user/lsp") -- LSP setup (language services)
    require("user/telescope") -- Telescope setup (searching)
    require("user/whichkey") -- Keymap display
end
