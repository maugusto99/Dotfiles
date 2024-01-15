local wezterm = require("wezterm")
local act = wezterm.action

local M = {} -- This is Module definition

function M.setup(config) -- function inside the Module
	config.leader = { key = "phys:Space", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		{
			key = "phys:Space",
			mods = "LEADER|CTRL",
			action = wezterm.action.SendKey({ key = "phys:Space", mods = "CTRL" }),
		},

		{ key = "n", mods = "SHIFT|CTRL", action = act.SendKey({ key = "n", mods = "SHIFT|CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "p", mods = "LEADER", action = act.ActivateCommandPalette },

		-- Pane keybindings
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

		-- SHIFT is for when caps lock is on
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
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
end

return M --If I call this script returns the Module
