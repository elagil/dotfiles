require("user/packer_setup")

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim" -- Packer can manage itself

    use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
    use {"ms-jpq/coq_nvim", branch="coq", run = "python3 -m coq deps"} -- Autocompletion
    use {"ms-jpq/coq.artifacts", branch="artifacts"} -- Snippets

    use "mg979/vim-visual-multi" -- Multicursor, like in VSCode
    use { -- A nice status line
        "nvim-lualine/lualine.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
            opt = true
        }
    }

    use "numToStr/Comment.nvim" -- Commenting tool

    use { -- A file tree viewer
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        }
    }

    use { -- Telescope, a global search tool
      "nvim-telescope/telescope.nvim", 
      tag = "0.1.0",
      requires = { 
          {"nvim-lua/plenary.nvim", "BurntSushi/ripgrep"} 
      }
    }
    use { -- Telescope fzf sorting integration
        "nvim-telescope/telescope-fzf-native.nvim", 
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" 
    }
    
    use {"lewis6991/gitsigns.nvim"} -- git signs in the sidebar

    use "mfussenegger/nvim-dap" -- Debug adapters
    use "mfussenegger/nvim-dap-python" -- Python debug adapter
    use { "rcarriga/nvim-dap-ui", -- Debugging user interface
        requires = {"mfussenegger/nvim-dap"} 
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                flavour = "macchiato", -- mocha, macchiato, frappe, latte
                integrations = {
                    native_lsp = { -- Support for nvim-lsp
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    dap = { -- Support for nvim-dap
                        enabled = true,
                        enabled_ui = true, -- enable nvim-dap-ui
                    },
                    gitsigns = true,
                    treesitter = false -- FIXME: Disable for now, since no treesitter is available
                }
            }
            vim.api.nvim_command "colorscheme catppuccin"
        end
    }
    
    -- Automatic setup of configuration
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
