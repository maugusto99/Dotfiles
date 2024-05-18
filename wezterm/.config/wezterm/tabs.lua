local wezterm = require("wezterm")
local act = wezterm.action

local M = {} -- This is Module definition

function M.setup(config)
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_bar_at_bottom = true

	wezterm.on("format-tab-title", function(tab, tabs, panes)
		local zoomed = ""
		if tab.active_pane.is_zoomed then
			zoomed = " "
		end

		local index = ""
		if #panes > 1 then
			index = string.format("[%d/%d] ", tab.active_pane.pane_index + 1, #panes)
		end

		return " " .. zoomed .. index .. tab.active_pane.title .. " "
	end)
end
return M
