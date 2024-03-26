local wezterm = require("wezterm")
local act = wezterm.action

local M = {} -- This is Module definition

M.mod = "SHIFT|CTRL"

M.smart_split = wezterm.action_callback(function(window, pane)
	local dim = pane:get_dimensions()
	if dim.pixel_height > dim.pixel_width then
		window:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
	else
		window:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
	end
end)

function M.setup(config)
	config.disable_default_key_bindings = true

	config.keys = {
		-- Scrollback
		{ mods = M.mod, key = "k", action = act.ScrollByLine(-1) },
		{ mods = M.mod, key = "j", action = act.ScrollByLine(1) },
		-- New Tab
		{ mods = M.mod, key = "t", action = act.SpawnTab("CurrentPaneDomain") },
		-- Splits
		{ mods = M.mod, key = "Enter", action = M.smart_split },
		{ mods = M.mod, key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = M.mod, key = "_", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- Move Tabs
		{ mods = M.mod, key = ">", action = act.MoveTabRelative(1) },
		{ mods = M.mod, key = "<", action = act.MoveTabRelative(-1) },
		-- Acivate Tabs
		{ mods = M.mod, key = "l", action = act({ ActivateTabRelative = 1 }) },
		{ mods = M.mod, key = "h", action = act({ ActivateTabRelative = -1 }) },
		{ mods = M.mod, key = "R", action = wezterm.action.RotatePanes("Clockwise") },
		{ key = "Tab", mods = "CTRL", action = act({ ActivateTabRelative = 1 }) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = act({ ActivateTabRelative = -1 }) },
		-- Activate Panes
		{ key = "h", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Down") },

		-- Activate pane interactive
		{ key = "s", mods = "ALT|CTRL", action = act.PaneSelect({ mode = "Activate" }) },

		-- show the pane selection mode, but have it swap the active and selected panes
		{ mods = M.mod, key = "S", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },

		-- Clipboard
		{ mods = M.mod, key = "C", action = act.CopyTo("Clipboard") },
		{ mods = M.mod, key = "V", action = act.PasteFrom("Clipboard") },
		{ mods = M.mod, key = "Space", action = act.QuickSelect },
		{ mods = M.mod, key = "X", action = act.ActivateCopyMode },
		{ mods = M.mod, key = "f", action = act.Search("CurrentSelectionOrEmptyString") },
		{ mods = M.mod, key = "Z", action = act.TogglePaneZoomState },
		{ mods = M.mod, key = "p", action = act.ActivateCommandPalette },

		-- Font resize
		{ mods = "CTRL", key = "+", action = act.IncreaseFontSize },
		{ mods = "CTRL", key = "-", action = act.DecreaseFontSize },
		{ mods = "CTRL", key = "Backspace", action = act.ResetFontSize },

		-- Open new tab in distrobox host
		{
			key = "d",
			mods = M.mod,
			action = wezterm.action.SpawnCommandInNewTab({ args = { "distrobox-host-exec", "bash" } }),
		},

		{ key = "PageUp", mods = "CTRL|SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "CTRL|SHIFT", action = act.ScrollByPage(1) },
		{ key = "r", mods = M.mod, action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
	}

	config.key_tables = {
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
	}
end

return M --If I call this script returns the Module
