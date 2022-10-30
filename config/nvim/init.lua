-- Load plugins first
require("user/plugins")

-- Setup and load plugins
require("user/options") -- General options
require("user/keymap") -- General keymap
require("user/nvim-tree") -- Sidebar folder tree view
require("user/lualine") -- Status line
require("user/gitlines") -- Git status on the side
require("user/comment") -- Commenting tool
require("user/trouble") -- Show problems in a panel
require("user/dap") -- DAP setup (debug services)
require("user/lsp") -- LSP setup (language services)
require("user/telescope") -- Telescope setup (searching)
require("user/theming") -- Apply visual settings
