local colors = require("gruvbox.palette")
require("bufferline").setup({
	options = {
		mode = "tabs",
		separatorstyle = "slant",
		color_icons = false,
	},
  highlights = {
      fill = {
          -- fg = '<colour-value-here>',
          bg = colors.dark0,
      },
      background = {
          -- fg = '<colour-value-here>',
          -- bg = '<colour-value-here>'
      },
  }
})
