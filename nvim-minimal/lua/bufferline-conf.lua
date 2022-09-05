local status, bufferline = pcall(require, "bufferline")
bufferline.setup({
	options = {
		mode = "tabs",
		separatorstyle = "slant",
		color_icons = true,
	},
})
