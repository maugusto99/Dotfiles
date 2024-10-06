local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("keys").setup(config)
require("tabs").setup(config)

-- Program
config.default_prog = { "/usr/bin/fish", "-l" }

-- Colorscheme
config.color_scheme = "Catppuccin Mocha"

-- Fonts
config.font_size = 10
config.font = wezterm.font({ family = "JetBrains Mono" })
config.bold_brightens_ansi_colors = true
config.underline_thickness = 2
config.cursor_thickness = 2
-- config.underline_position = -6
config.adjust_window_size_when_changing_font_size = false

-- Cursor
config.default_cursor_style = "SteadyBar"
config.force_reverse_video_cursor = true
config.scrollback_lines = 10000

-- Command Palette
config.command_palette_font_size = 12

-- Window
config.window_padding = { left = 2, right = 2, top = 2, bottom = 2 }
config.window_decorations = "RESIZE"
config.initial_cols = 170
config.initial_rows = 35

-- Misc
config.enable_wayland = true


return config
