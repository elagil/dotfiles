require("user/plugins/packer-setup")

local packer = require("packer")

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself

	-- Language services
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Adds linters and fixers to LSP
	use("williamboman/mason.nvim") -- Install LSP configurations

	-- Debugging
	use("mfussenegger/nvim-dap") -- Debug adapters
	use("mfussenegger/nvim-dap-python") -- Python debug adapter
	use("rcarriga/nvim-dap-ui") -- Debugging UI

	-- Code completion
	use("hrsh7th/nvim-cmp") -- The completion tool itself
	use("hrsh7th/cmp-nvim-lsp") -- LSP completion source
	use("hrsh7th/cmp-nvim-lsp-document-symbol") -- Completions from symbols in the current buffer, during `/` search
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- Completions for call signatures
	use("hrsh7th/cmp-buffer") -- Completions from the current buffer
	use("hrsh7th/cmp-path") -- Completions for file system paths and directories
	use("hrsh7th/cmp-cmdline") -- Completions for the VIM command line

	-- Snippets
	use("rafamadriz/friendly-snippets") -- Snippet database
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("saadparwaiz1/cmp_luasnip") -- Snippet adapter for cmp

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

	-- Other tools
	use("mg979/vim-visual-multi") -- Multicursor, like in VSCode
	use("nvim-lualine/lualine.nvim") -- A nice status line
	use("numToStr/Comment.nvim") -- Commenting tool
	use("nvim-tree/nvim-tree.lua") -- A file tree viewer
	use("tpope/vim-fugitive") -- A git wrapper
	use("lewis6991/gitsigns.nvim") -- git signs in the sidebar
	use("folke/trouble.nvim") -- Pretty display of diagnostics
	use({ -- A markdown previewer
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("nvim-tree/nvim-web-devicons") -- An icons set, required by multiple other plugins
	use("lukas-reineke/indent-blankline.nvim") -- Show indentation guides
	use("catppuccin/nvim") -- A theme

	-- Automatic setup of configuration
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
