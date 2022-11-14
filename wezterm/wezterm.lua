local wezterm = require('wezterm')

return {
  default_prog = { '/usr/bin/fish', '-l' },
  -- color scheme
  color_scheme = "GruvboxDark (Gogh)",
  --window opacity reduced
  window_background_opacity = .95,
  -- make sure you use a font you have installed
  font = wezterm.font 'JetBrains Mono',
  font_size = 10,
  scrollback_lines = 10000,
  default_cursor_style = "SteadyBar",
  hide_tab_bar_if_only_one_tab = true,
  window_frame = {
      font_size = 10.0,

  }
}
