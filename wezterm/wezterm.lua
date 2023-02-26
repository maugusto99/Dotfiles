local wezterm = require("wezterm")
local act = wezterm.action

local function font(opts)
	return wezterm.font_with_fallback({
		opts,
		"Symbols Nerd Font Mono",
	})
end

return {

	default_prog = { "/usr/bin/fish", "-l" },

-- Font Config
	font = font({ family = "Fira Code" }),
	font_size = 11,
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

-- Misc
	scrollback_lines = 1000000,
	hide_tab_bar_if_only_one_tab = true,
	force_reverse_video_cursor = true,
	window_close_confirmation = "NeverPrompt",

-- UI
	color_scheme = "tokyonight",
  cell_width = 0.9,
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

  -- Keymaps
	keys = {

		{ key = "-", mods = "ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "H", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "H", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "L", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "L", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "K", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "K", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "J", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "J", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },

	},
}
