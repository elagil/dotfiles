require("user/plugins/packer-setup")

local packer = require("packer")

return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Packer can manage itself

    --------------------
    -- Language services
    use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
    use("jose-elias-alvarez/null-ls.nvim") -- Adds linters and fixers to LSP
    use("williamboman/mason.nvim") -- Install LSP configurations
    use("williamboman/mason-lspconfig.nvim") -- Adapter between mason and lspconfig
    use({ -- Syntax highlighting with Treesitter
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use("lvimuser/lsp-inlayhints.nvim") -- Inlay hint support

    ------------------------
    -- Debugging and testing
    use("mfussenegger/nvim-dap") -- Debug adapters
    use("mfussenegger/nvim-dap-python") -- Python debug adapter
    use("rcarriga/nvim-dap-ui") -- Debugging UI
    use({ -- Test interface
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/neotest-python",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    })

    ------------------
    -- Code completion
    use("hrsh7th/nvim-cmp") -- The completion tool itself
    use("hrsh7th/cmp-nvim-lsp") -- LSP completion source
    use("hrsh7th/cmp-nvim-lsp-document-symbol") -- Completions from symbols in the current buffer, during `/` search
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- Completions for call signatures
    use("hrsh7th/cmp-buffer") -- Completions from the current buffer
    use("hrsh7th/cmp-path") -- Completions for file system paths and directories
    use("hrsh7th/cmp-cmdline") -- Completions for the VIM command line

    -----------
    -- Snippets
    use("rafamadriz/friendly-snippets") -- Snippet database
    use("L3MON4D3/LuaSnip") -- Snippet engine
    use("saadparwaiz1/cmp_luasnip") -- Snippet adapter for cmp

    ----------------------------------
    -- Telescope, a global search tool
    use({ -- Telescope itself
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })

    use({ -- Telescope fzf sorting integration
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    use({ "nvim-telescope/telescope-file-browser.nvim" }) -- Telescope file browser

    use({ -- A markdown previewer
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    use({ "akinsho/toggleterm.nvim", tag = "*" }) -- Terminal opener

    ---------------------------------
    -- Movement and text manipulation
    use("numToStr/Comment.nvim") -- Commenting tool
    use({ "ggandor/leap.nvim" }) -- Jump to text in the visible buffer
    use({ "kylechui/nvim-surround", tag = "*" }) -- Surround selections with text

    ----------------------------------
    -- Editor appearance and usability
    use("nvim-tree/nvim-web-devicons") -- An icons set, required by multiple other plugins

    -- neotree
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
    })
    use("mrbjarksen/neo-tree-diagnostics.nvim") -- neotree diagnostics source

    use("nvim-lualine/lualine.nvim") -- A nice status line
    use("RRethy/vim-illuminate") -- Illuminate occurrences of word under cursor
    use("lukas-reineke/indent-blankline.nvim") -- Show indentation guides
    use({ "catppuccin/nvim", as = "theme" }) -- A theme
    use({ "akinsho/bufferline.nvim", tag = "v3.*" }) -- A bufferline

    ------
    -- Git
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    use("lewis6991/gitsigns.nvim") -- git signs in the sidebar

    -- Automatic setup of configuration
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
