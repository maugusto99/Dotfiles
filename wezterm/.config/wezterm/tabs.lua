local wezterm = require("wezterm")

local M = {} -- This is Module definition

local function tab_title(tab)
	local title_info = tab.tab_title
	if title_info and #title_info > 0 then
		title = title_info
	end
	local title = tab.active_pane.title
	local is_zoomed = false
	for _, pane in ipairs(tab.panes) do
		if pane.is_zoomed then
			is_zoomed = true
			break
		end
	end
	if is_zoomed then
		title = "  " .. title
	end
	return title
end

function M.setup(config)
	config.show_new_tab_button_in_tab_bar = false
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = true
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_max_width = 32
	config.unzoom_on_switch_pane = true
	local scheme = wezterm.get_builtin_color_schemes()["Catppuccin Mocha"]

	wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
		local background = scheme.tab_bar.inactive_tab.bg_color
		local foreground = scheme.tab_bar.inactive_tab.fg_color
		local edge_background = scheme.tab_bar.background

		if tab.is_active or hover then
			background = scheme.tab_bar.active_tab.bg_color
			foreground = scheme.tab_bar.active_tab.fg_color
		end
		local edge_foreground = background

		local title = tab_title(tab)

		local max = config.tab_max_width - 9
		if #title > max then
			title = wezterm.truncate_right(title, max) .. "…"
		end

		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = " " },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } },
			{ Text = " " .. title .. " " },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = "" },
		}
	end)
end
return M
