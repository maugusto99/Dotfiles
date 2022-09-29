vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use("shaunsingh/nord.nvim") -- Nord theme


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

	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
	})

  use 'nvim-treesitter/nvim-treesitter-context'

  use 'p00f/nvim-ts-rainbow'

	use({ "kyazdani42/nvim-web-devicons" })

  use({
    'norcalli/nvim-colorizer.lua',
    require'colorizer'.setup(),
  })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  })
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

end)
