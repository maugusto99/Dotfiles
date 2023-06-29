local wezterm = require("wezterm")
local act = wezterm.action

local function font(opts)
	return wezterm.font_with_fallback({
		opts,
		"Symbols Nerd Font Mono",
	})
end

local config = {}

config.default_prog = { "/usr/bin/fish", "-l" }
-- Font Config
config.font = font({ family = "JetBrains Mono" })
config.font_size = 11
-- Misc
config.scrollback_lines = 100000
config.hide_tab_bar_if_only_one_tab = true
config.force_reverse_video_cursor = true
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Gruvbox dark, hard (base16)"
config.bold_brightens_ansi_colors = true
config.initial_cols = 120
config.initial_rows = 30
config.use_fancy_tab_bar = true
config.window_frame = {
	font_size = 10.0,
	font = font({ family = "JetBrains Mono", weight = "Bold" }),
	-- active_titlebar_bg = "#191b26",
	-- inactive_titlebar_bg = "#1e2030",
}
config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}
-- config.colors = {
-- 	tab_bar = {
-- 		-- The color of the inactive tab bar edge/divider
-- 		inactive_tab_edge = "#1a1b26",
-- 		background = "#1a1b26",
-- 		active_tab = {
-- 			fg_color = "#c0caf5",
-- 			bg_color = "#222436",
-- 		},
-- 		inactive_tab = {
-- 			bg_color = "#1a1b26",
-- 			fg_color = "#414868",
-- 		},
-- 		inactive_tab_hover = {
-- 			bg_color = "#1a1b26",
-- 			fg_color = "#a9b1d6",
-- 		},
-- 		new_tab_hover = {
-- 			fg_color = "#1a1b26",
-- 			bg_color = "#82aaff",
-- 		},
-- 		new_tab = {
-- 			fg_color = "#c0caf5",
-- 			bg_color = "#1a1b26",
-- 		},
-- 	},
-- }
-- Keymaps
config.keys = {
	-- { key = "T", mods = "ALT|SHIFT", action = "ShowTabNavigator" },
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
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
}
config.hyperlink_rules = {
	-- Linkify things that look like URLs and the host has a TLD name.
	-- Compiled-in default. Used if you don't specify any hyperlink_rules.
	{
		regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
		format = "$0",
	},

	-- linkify email addresses
	-- Compiled-in default. Used if you don't specify any hyperlink_rules.
	{
		regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
		format = "mailto:$0",
	},

	-- file:// URI
	-- Compiled-in default. Used if you don't specify any hyperlink_rules.
	{
		regex = [[\bfile://\S*\b]],
		format = "$0",
	},

	-- Linkify things that look like URLs with numeric addresses as hosts.
	-- E.g. http://127.0.0.1:8000 for a local development server,
	-- or http://192.168.1.1 for the web interface of many routers.
	{
		regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
		format = "$0",
	},

	-- Make username/project paths clickable. This implies paths like the following are for GitHub.
	-- As long as a full URL hyperlink regex exists above this it should not match a full URL to
	-- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
	{
		regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
		format = "https://www.github.com/$1/$3",
	},
}
return config
