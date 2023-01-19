local wezterm = require('wezterm')
local keymaps = require('keymaps')

return {
  -- fish shell on start
  default_prog = { '/usr/bin/fish', '-l' },

  color_scheme = "Gruvbox dark, hard (base16)",

  font = wezterm.font 'JetBrains Mono Nerd Font',
  font_size = 9,

  scrollback_lines = 1000000,
  hide_tab_bar_if_only_one_tab = true,
  force_reverse_video_cursor = true,
  window_close_confirmation = 'NeverPrompt',
  bold_brightens_ansi_colors = true,


  -- initil window size
  initial_cols = 120,
  initial_rows = 30,

  window_frame = {
    font_size = 9.0,
  },

  keys = keymaps

}
