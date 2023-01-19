local wezterm = require('wezterm')
local keymaps = require('keymaps')
return {
  -- fish shell on start
  default_prog = { '/usr/bin/fish', '-l' },

  -- color_scheme = "GruvboxDark (Gogh)",
  -- color_scheme = "Gruvbox dark, hard (base16)",
  color_scheme = "tokyonight",

  font = wezterm.font 'Hasklug Nerd Font',
  font_size = 10,

  scrollback_lines = 1000000,
  hide_tab_bar_if_only_one_tab = true,
  force_reverse_video_cursor = true,
  window_close_confirmation = 'NeverPrompt',

  -- initil window size
  initial_cols = 120,
  initial_rows = 30,

  window_frame = {
    font_size = 9.0,
  },
  keys = keymaps

}
