local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("keys").setup(config)
require("tabs").setup(config)

config.default_prog = { "/usr/bin/fish", "-l" }

config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"
config.front_end = "WebGpu"
config.scrollback_lines = 5000

config.adjust_window_size_when_changing_font_size = false

config.force_reverse_video_cursor = true
config.color_scheme = "Catppuccin Mocha"

config.initial_cols = 140
config.initial_rows = 30
config.window_padding = { left = 1, right = 1, top = 1, bottom = 1 }

config.default_cursor_style = "SteadyBar"

config.font_size = 10.0
config.font = wezterm.font({
	family = "JetBrains Mono",
})

config.window_decorations = "RESIZE"
config.bold_brightens_ansi_colors = true
config.allow_square_glyphs_to_overflow_width = "Always"
config.term = "wezterm"
config.enable_kitty_keyboard = true

return config
