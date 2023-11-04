local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.default_prog = { "/usr/bin/fish" }
config.front_end = "WebGpu"
config.adjust_window_size_when_changing_font_size = false
config.webgpu_power_preference = "HighPerformance"
config.scrollback_lines = 100000
config.hide_tab_bar_if_only_one_tab = true
config.force_reverse_video_cursor = true
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Catppuccin Mocha"
config.bold_brightens_ansi_colors = true
config.initial_cols = 140
config.initial_rows = 30

config.font = wezterm.font({
	family = "JetBrains Mono",
})
config.font_size = 10.0
config.allow_square_glyphs_to_overflow_width = "Always"

config.window_frame = {
	font_size = 9.0,
	font = wezterm.font({ family = "Roboto", weight = "Medium" }),
}

config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}
-- Keys
config.leader = { key = "phys:Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "n", mods = "SHIFT|CTRL", action = act.SendKey({ key = "n", mods = "SHIFT|CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "p", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Pane keybindings
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- SHIFT is for when caps lock is on
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },

	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- Tab keybindings
	{ key = "[", mods = "LEADER|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER|SHIFT", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "l", mods = "LEADER|SHIFT", action = wezterm.action.ShowLauncher },

	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox-host-exec", "bash" },
		}),
	},
	{ key = "k", mods = "CTRL|SHIFT", action = act.ScrollByLine(-1) },
	{ key = "j", mods = "CTRL|SHIFT", action = act.ScrollByLine(1) },
	{ key = "PageUp", mods = "CTRL|SHIFT", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "CTRL|SHIFT", action = act.ScrollByPage(1) },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

config.launch_menu = {
	{
		label = "Host",
		args = { "distrobox-host-exec", "bash" },
	},
}

return config
