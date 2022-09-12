require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "python", "lua", "fortran", "bash", "fish" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {

		enable = true,

		additional_vim_regex_highlighting = false,

	},
    rainbow = {

        enable = true,

        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean

        max_file_lines = nil, -- Do not enable for files with more than n lines, int

      }
})
