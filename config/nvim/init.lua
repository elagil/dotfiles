-- Start plugins
require("telescope").load_extension("fzf")
require("nvim-tree").setup()
require("gitsigns").setup()
require("lualine").setup()
require("Comment").setup()

-- Main configuration file
require("user/options") -- General options
require("user/plugins") -- Loading of plugins
require("user/keymap") -- General keymap
require("user/dap") -- DAP settings (debug services)
require("user/lsp") -- LSP settings (language services)

