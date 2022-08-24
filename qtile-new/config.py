# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty"

keys = [

    # Change Focus

    Key([mod], "h",
    lazy.layout.left(),
    desc="Move focus to left"),

    Key([mod], "l",
    lazy.layout.right(),
    desc="Move focus to right"),

    Key([mod],
    "j", lazy.layout.down(),
    desc="Move focus down"),

    Key([mod],
    "k", lazy.layout.up(),
    desc="Move focus up"),

    Key([mod],
    "Left", lazy.layout.left(),
    desc="Move focus to left"),

    Key([mod],
    "Right", lazy.layout.right(),
    desc="Move focus to right"),

    Key([mod],
    "Down", lazy.layout.down(),
    desc="Move focus down"),

    Key([mod],
    "Up", lazy.layout.up(),
    desc="Move focus up"),

    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.

    Key([mod, "shift"], "h",
    lazy.layout.shuffle_left(),
    lazy.layout.swap_left(),
    desc="Move window to the left"),

    Key([mod, "shift"], "l",
    lazy.layout.shuffle_right(),
    lazy.layout.swap_right(),
    desc="Move window to the right"),

    Key([mod, "shift"], "j",
    lazy.layout.shuffle_down(),
    desc="Move window down"),

    Key([mod, "shift"], "k",
    lazy.layout.shuffle_up(),
    desc="Move window up"),

    Key([mod, "shift"], "Left",
    lazy.layout.shuffle_left(),
    lazy.layout.swap_left(),
    desc="Move window to the left"),

    Key([mod, "shift"], "Right",
    lazy.layout.shuffle_right(),
    lazy.layout.swap_right(),
    desc="Move window to the right"),

    Key([mod, "shift"], "Down",
    lazy.layout.shuffle_down(),
    desc="Move window down"),

    Key([mod, "shift"], "Up",
    lazy.layout.shuffle_up(),
    desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.

    Key([mod, "control"], "h",
    lazy.layout.shrink(),
    lazy.layout.add(),
    desc="Grow window to the left"),

    Key([mod, "control"], "l",
    lazy.layout.grow(),
    lazy.layout.delete(),
    desc="Grow window to the right"),

    Key([mod, "control"], "j",
    lazy.layout.grow_down(),
    lazy.layout.shrink(),
    desc="Grow window down"),

    Key([mod, "control"], "k",
    lazy.layout.grow_up(),
    desc="Grow window up"),

    Key([mod, "control"], "Left",
    lazy.layout.shrink(),
    lazy.layout.add(),
    desc="Grow window to the left"),

    Key([mod, "control"], "Right",
    lazy.layout.grow(),
    lazy.layout.delete(),
    desc="Grow window to the right"),

    Key([mod, "control"], "Down",
    lazy.layout.grow_down(),
    lazy.layout.shrink(),
    desc="Grow window down"),

    Key([mod, "control"], "Up",
    lazy.layout.grow_up(),
    desc="Grow window up"),

    Key([mod], "n",
    lazy.layout.normalize(),
    desc="Reset all window sizes"),

    # Flip Monadtall/monadwide
    Key([mod,"shift"],"f",
    lazy.layout.flip(),
    desc="Flip windows"),

    # Toggle floating layout
    Key([mod, "shift"], "space",
    lazy.window.toggle_floating(),
    desc="Toggle floating"),

    Key([mod], "m",
    lazy.window.toggle_fullscreen(),
    desc="toggle fullscreen"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
    lazy.next_layout(),
    desc="Toggle between layouts"),

    # Essentials

    Key([mod,"shift"], "c",
    lazy.window.kill(),
    desc="Kill focused window"),

    Key([mod, "shift"], "r",
    lazy.reload_config(),
    desc="Reload the config"),

    Key([mod, "shift"], "q",
    lazy.shutdown(),
    desc="Shutdown Qtile"),


    # Applications

    Key([mod], "Return",
    lazy.spawn(terminal),
    desc="Launch terminal"),

    Key([mod], "b",
    lazy.spawn("brave"),
    desc="Launch Brave"),

    Key([mod], "f",
    lazy.spawn("thunar"),
    desc="Launch Thunar"),

    Key(["control", "shift"], "e",
    lazy.spawn("emacs"),
    desc='Doom Emacs'),

    # Rofi

    Key([mod,"shift"], "Return",
    lazy.spawn("zsh -c 'rofi -show-icons -show drun'"),
    desc="Launch rofi"),

    Key([mod,"shift"], "a",
    lazy.spawn("zsh -c 'rofi -show-icons -modi filebrowser -show'"),
    desc="Launch rofi filebrowser"),

    Key([mod], "a",
    lazy.spawn("zsh -c '/home/augustom/.config/rofi/launchers/launcher.sh'"),
    desc='Run Launchpad'),

    Key(["mod1"], "Tab",
    lazy.spawn("zsh -c 'rofi -show-icons -show window'"),
    desc="Launch rofi cycle windows "),

    Key(["mod1"], "Return",
    lazy.spawn("zsh -c 'rofi -show run -theme ~/.config/rofi/themes/nord-oneline.rasi'"),
    desc="Launch rofi dmenu"),

    Key([mod], "p",
    lazy.spawn("zsh -c '/home/augustom/.config/rofi/powermenu/powermenu.sh'"),
    desc='Powermenu'),

    # Media Keys

    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 1%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 1%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle")),

    # Brightness

    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),

]


groups = [
          Group("1", layout="monadtall",label="",matches=Match(wm_class=["brave-browser", "firefox"])),
          Group("2", layout="monadtall",label=""),
          Group("3", layout="monadtall",label="",matches=Match(wm_class=["emacs"])),
          Group("4", layout="monadtall",label=""),
          Group("5", layout="monadtall",label="",matches=Match(wm_class=["Octave", "Figure 1" ,"Figure 2"])),
          Group("6", layout="monadtall",label="",matches=Match(wm_class=["Steam"])),
          Group("7", layout="monadtall",label=""),


]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors = [["#3B4252", "#3B4252"], #0
          ["#2E3440", "#2E3440"], #1
          ["#D8DEE9", "#D8DEE9"], #2
          ["#BF616A", "#BF616A"], #3
          ["#A3BE8C", "#A3BE8C"], #4
          ["#D08770", "#D08770"], #5
          ["#81A1C1", "#81A1C1"], #6
          ["#B48EAD", "#B48EAD"], #7
          ["#88C0D0", "#88C0D0"], #8
          ["#a9a1e1", "#a9a1e1"], #9
          ["#ebcb8b", "#ebcb8b"], #10
          ["#8FBCBB", "#8FBCBB"], #11
          ["#5E81AC", "#5E81AC"], #12
          ]

layout_theme = dict(
    border_width=2,
    margin=8,
    border_focus=colors[6],
    border_normal=colors[1],

)


layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Max(),
]

widget_defaults = dict(
    font="UbuntuMono Nerd Font",
    fontsize=14,
    padding=4,
    background = colors[1],
)

extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [

                    widget.Sep(
                            linewidth = 0,
                            padding = 6,
                            foreground = colors[2],
                            ),
                    widget.Image(
                            filename = "~/.config/qtile/icons/arch-logo-white.png",
                            scale = 0.6,
                            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('/home/augustom/.config/rofi/powermenu/powermenu.sh')},
                            margin = 2
                            ),
                    widget.Sep(
                            linewidth = 0,
                            padding = 6,
                            foreground = colors[2],
                            ),
                    widget.WindowName(
                            foreground = colors[2],
                            padding = 6,
                            max_chars = 40,
                            ),
                    widget.Spacer(),
                    widget.GroupBox(
                            fontsize = 16,
                            font = "Font Awesome 6 Free",
                            margin_y = 3,
                            margin_x = 0,
                            padding_y = 5,
                            padding_x = 3,
                            active = colors[12],
                            inactive = colors[2],
                            highlight_color = colors[1],
                            highlight_method = "text",
                            this_current_screen_border = colors[8],
                            # this_screen_border = colors [0],
                            # other_current_screen_border = colors[6],
                            # other_screen_border = colors[6],
                            foreground = colors[2],
                            ),
                    widget.Spacer(),
                    widget.Sep(
                            linewidth = 0,
                            padding = 6,
                            foreground = colors[1],
                            ),
                    widget.TextBox(
                            text = '',
                            font = "Font Awesome 6 Free",
                            foreground = colors[3],
                            padding = 2,
                            ),
                    widget.CheckUpdates(
                            update_interval = 1000,
                            distro = "Arch_checkupdates",
                            display_format = "{updates}",
                            foreground = colors[3],
                            colour_have_updates = colors[3],
                            colour_no_updates = colors[3],
                            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo paru -Syu')},
                            no_update_string = '0',
                            padding = 5,
                            ),
                    widget.TextBox(
                            text = '',
                            font = "Font Awesome 6 Free",
                            foreground = colors[8],
                            padding = 2,
                            ),
                    widget.Memory(
                            foreground = colors[8],
                            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
                            fmt = '{}',
                            format= '{MemUsed:.0f}{mm}',
                            padding = 5
                            ),
                    widget.TextBox(
                            text = '',
                            font = "Font Awesome 6 Free",
                            foreground = colors[5],
                            padding = 2,
                            fontsize = 12
                            ),
                    widget.CPU(
                            foreground = colors[5],
                            fmt = '{}',
                            format= '{load_percent}%',
                            padding = 5
                            ),
                    widget.TextBox(
                            text = '',
                            font = "Font Awesome 6 Free",
                            foreground = colors[7],
                            padding = 2,
                            fontsize = 12
                            ),
                    widget.Volume(
                            foreground = colors[7],
                            fmt = '{}',
                            padding = 5,
                            ),
                    widget.TextBox(
                            text = '',
                            font = "Font Awesome 6 Free",
                            foreground = colors[10],
                            padding = 2,
                            fontsize = 12
                            ),
                    widget.Clock(
                            foreground = colors[10],
                            format = "%H:%M"
                            ),
                    widget.TextBox(
                            text = '',
                            font = "Font Awesome 6 Free",
                            foreground = colors[9],
                            padding = 2,
                            fontsize = 12
                            ),
                    widget.Clock(
                            foreground = colors[9],
                            format = '%d/%m/%y'
                            ),
                    widget.Systray(
                            foreground = colors[2],
                            padding = 6,
                            icon_size=15,
                            ),
                    widget.CurrentLayoutIcon(
                            custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                            foreground = colors[2],
                            padding = 3,
                            scale = 0.65
                            ),
                    widget.Sep(
                            linewidth = 0,
                            padding = 6,
                            foreground = colors[2],
                            ),
]

    return widgets_list



screens = [
    Screen(
        top=bar.Bar(
            widgets=init_widgets_list(),
            size=25,
            border_width=[0, 0, 2, 0],  # Draw top and bottom borders
            border_color=["000000", "000000", "#81A1C1", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(**layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="'Choose a molecule file'"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])





wmname = "LG3D"
