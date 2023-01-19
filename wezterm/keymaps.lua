local wezterm = require 'wezterm'
local act = wezterm.action

return {
  { key = 'H', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'H', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'L', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'L', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'K', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'K', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'J', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'J', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Down', 1 } },

}
