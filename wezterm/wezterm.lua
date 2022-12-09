local wezterm = require('wezterm')

return {
  -- fish shell on start
  default_prog = { '/usr/bin/fish', '-l' },

  -- color scheme
  -- color_scheme = "GruvboxDark (Gogh)",
 color_scheme = "Gruvbox dark, hard (base16)",
  --window opacity reduced
  -- window_background_opacity = .96,

  -- make sure you use a font you have installed
  font = wezterm.font 'JetBrains Mono',
  font_size = 10,

  scrollback_lines = 1000000,
  hide_tab_bar_if_only_one_tab = true,
  force_reverse_video_cursor = true,

  -- initil window size
  initial_cols = 120,
  initial_rows = 30,

  window_frame = {
      font_size = 10.0,
  },

}
