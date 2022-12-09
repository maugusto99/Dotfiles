vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)

	use("wbthomason/packer.nvim") -- Have packer manage itself

	use("shaunsingh/nord.nvim") -- Nord theme

  use { "ellisonleao/gruvbox.nvim" }


	use({ -- Comment nvim
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({ -- Lualine
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
	})

  use 'nvim-treesitter/nvim-treesitter-context'

  use 'p00f/nvim-ts-rainbow'

	use({ "kyazdani42/nvim-web-devicons" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'lukas-reineke/indent-blankline.nvim'                                            -- Add indentation guides even on blank lines

  use 'neovim/nvim-lspconfig'                                                          -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'                                                        -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                    -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                -- Snippet Engine and Snippet Expansion

  -- use {'norcalli/nvim-colorizer.lua',
  --     require'colorizer'.setup()
  -- }
use({'NTBBloodbath/doom-one.nvim'})

end)
