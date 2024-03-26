local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("keys").setup(config)

config.default_prog = { "/usr/bin/fish", "-l" }

config.front_end = "WebGpu"
-- config.front_end = "OpenGL" -- current work-around for https://github.com/wez/wezterm/issues/4825
config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"

config.adjust_window_size_when_changing_font_size = false
config.scrollback_lines = 10000
config.hide_tab_bar_if_only_one_tab = true
config.force_reverse_video_cursor = true
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Catppuccin Mocha"

config.initial_cols = 140
config.initial_rows = 30
config.animation_fps = 60
config.max_fps = 60
config.default_cursor_style = "SteadyBar"
config.window_decorations = "RESIZE"
config.font_size = 11.0
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Light",
})

config.bold_brightens_ansi_colors = true
config.allow_square_glyphs_to_overflow_width = "Always"

config.window_frame = {
	font_size = 9.0,
	font = wezterm.font({ family = "Roboto", weight = "Regular" }),
}

config.window_padding = {
	left = 6,
	right = 6,
	top = 6,
	bottom = 6,
}

return config
