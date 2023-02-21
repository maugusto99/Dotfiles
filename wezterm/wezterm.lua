local wezterm = require("wezterm")
local keymaps = require("keymaps")

local function font(opts)
	return wezterm.font_with_fallback({
		opts,
		"Symbols Nerd Font Mono",
	})
end

return {
	default_prog = { "/usr/bin/fish", "-l" },
	color_scheme = "tokyonight",
	font_size = 10,
	font = font({ family = "Fira Code" }),
	font_rules = {
		{
			italic = true,
			intensity = "Normal",
			font = font({
				family = "Victor Mono",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Half",
			font = font({
				family = "Victor Mono",
				weight = "DemiBold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Bold",
			font = font({
				family = "Victor Mono",
				weight = "Bold",
				style = "Italic",
			}),
		},
	},
	scrollback_lines = 1000000,
	hide_tab_bar_if_only_one_tab = true,
	force_reverse_video_cursor = true,
	window_close_confirmation = "NeverPrompt",
	bold_brightens_ansi_colors = true,
	initial_cols = 150,
	initial_rows = 35,
	window_frame = {
		font_size = 10.0,
		font = font({ family = "Fira Code", weight = "Bold" }),
		active_titlebar_bg = "#191b26",
		inactive_titlebar_bg = "#1e2030",
	},
	window_padding = {
		left = 1,
		right = 1,
		top = 1,
		bottom = 1,
	},
	colors = {
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			inactive_tab_edge = "#1a1b26",
			background = "#1a1b26",
			active_tab = {
				fg_color = "#c0caf5",
				bg_color = "#222436",
			},
			inactive_tab = {
				bg_color = "#1a1b26",
				fg_color = "#414868",
			},
			inactive_tab_hover = {
				bg_color = "#1a1b26",
				fg_color = "#a9b1d6",
			},
			new_tab_hover = {
				fg_color = "#1a1b26",
				bg_color = "#82aaff",
			},
			new_tab = {
				fg_color = "#c0caf5",
				bg_color = "#1a1b26",
			},
		},
	},
	keys = keymaps,
}
