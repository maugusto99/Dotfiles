# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
# from libqtile.utils import


mod = "mod4"              # Sets mod key to SUPER/WINDOWS
myTerm = "alacritty"      # My terminal of choice
myBrowser = "brave"       # My browser of choice
myFileManager= "thunar"  # My filebrowser of choice
# mod1 es ALT

keys = [
         # The essentials
         Key([mod], "Return",
             lazy.spawn(myTerm),
             desc='Launches My Terminal'
             ),
         Key([mod, "shift"], "Return",
             lazy.spawn("rofi -show-icons -show drun"),
             desc='Run Launcher'
             ),
         Key([mod], "a",
             lazy.spawn("sh /home/augustom/.config/rofi/launchers/launcher.sh"),
             desc='Run Launchpad'
             ),
         Key([mod,"shift"], "a",
             lazy.spawn("rofi -show-icons -modi filebrowser -show"),
             desc='Run FileBrowser'
             ),
         Key(["mod1"], "Tab",
             lazy.spawn("rofi -show-icons -show window"),
             desc='Cycle Windows'
             ),
         Key([mod], "b",
             lazy.spawn(myBrowser),
             desc='Brave'
             ),
         Key(["mod1"], "Return",
             lazy.spawn("rofi -show run -theme ~/.config/rofi/themes/nord-oneline.rasi "),
             desc='Run a Command'
             ),
         Key([mod,"shift"], "n",
             lazy.spawn("betterlockscreen -l"),
             desc='Lock screen'
             ),
         Key([mod], "p",
             lazy.spawn("sh /home/augustom/.config/rofi/powermenu/powermenu.sh"),
             desc='Powermenu'
             ),
         Key([mod], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key([mod, "shift"], "c",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key([mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key([mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         Key(["control", "shift"], "e",
             lazy.spawn("emacs"),
                    desc='Doom Emacs'
             ),
         Key([mod], "f",
             lazy.spawn(myFileManager),
             desc='Launches My File Manager'
             ),

         #  Brightness
         Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+")),
         Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),

         #  Media Keys
         Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
         Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
         Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
         Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 1%+")),
         Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 1%-")),
         Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle")),


# CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),


# RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),


# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

# FLIP LAYOUT FOR BSP
    # Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    # Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    # Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    # Key([mod, "mod1"], "h", lazy.layout.flip_left()),

# MOVE WINDOWS UP OR DOWN BSP LAYOUT
    # Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    # Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    # Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
    Key([mod], "m", lazy.window.toggle_fullscreen())

]


groups = [Group("1", layout='monadtall'),
          Group("2", layout='monadtall'),
          Group("3", layout='monadtall'),
          Group("4", layout='monadtall'),
          Group("5", layout='monadtall'),
          Group("6", layout='monadtall'),
          Group("7", layout='monadtall'),
          Group("8", layout='monadtall'),
          # Group("9", layout='monadtall'),
          ]
# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "#4c566a",
                "border_normal": "#1D2330"
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme)
    # layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.Tile(shift_windows=True, **layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    # layout.Stack(num_stacks=2),
    # layout.RatioTile(**layout_theme),
    # layout.TreeTab(),
]

# colors = [
#             ["#333945", "#333945"],  # 0 one dark black-bright(doom emac's highlighted text color)
#             ["#3b4252", "#3b4252"],  # 1 background lighter
#             ["#81a1c1", "#81a1c1"],  # 2 foreground
#             ["#ff6060", "#ff6060"],  # 3 red
#             ["#a3be8c", "#a3be8c"],  # 4 green
#             ["#ebcb8b", "#ebcb8b"],  # 5 yellow
#             ["#81a1c1", "#81a1c1"],  # 6 blue
#             ["#d8dee9", "#d8dee9"],  # 7 white
#             ["#88c0d0", "#88c0d0"],  # 8 cyan
#             ["#b48ead", "#b48ead"],  # 9 magenta
#             ["#4c566a", "#4c566a"],  # 10 grey
#             ["#d08770", "#d08770"],  # 11 orange
#             ["#8fbcbb", "#8fbcbb"],  # 12 super cyan
#             ["#5e81ac", "#5e81ac"],  # 13 super blue
# ]
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
          ]


prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font = "Roboto Medium",
    fontsize = 13,
    padding = 2,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Image(
                       filename = "~/.config/qtile/icons/endeavour_flat_smaller_center.svg",
                       scale = 0.2,
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(' sh /home/augustom/.config/rofi/powermenu/powermenu.sh ')},
                       background = colors[0],
                       margin = 2
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.GroupBox(
                       fontsize = 14,
                       # font = "Roboto Medium",
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 2,
                       borderwidth = 2,
                       active = colors[6],
                       inactive = colors[2],
                       rounded = True,
                       highlight_color = colors[0],
                       highlight_method = "line",
                       this_current_screen_border = colors[6],
                       this_screen_border = colors [6],
                       other_current_screen_border = colors[6],
                       other_screen_border = colors[6],
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.WindowName(
                       foreground = colors[2],
                       background = colors[0],
                       padding = 6,
                       max_chars = 30,
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[0]
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
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
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo paru -Syu')},
                       no_update_string = '0',
                       padding = 5,
                       background = colors[0],
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
                       foreground = colors[8],
                       padding = 2,
                       ),
              widget.Memory(
                       foreground = colors[8],
                       background = colors[0],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                       fmt = '{}',
                       format= '{MemUsed:.0f}{mm}',
                       padding = 5
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
                       foreground = colors[5],
                       padding = 2,
                       fontsize = 12
                       ),
              widget.CPU(
                       foreground = colors[5],
                       background = colors[0],
                       fmt = '{}',
                       format= '{load_percent}%',
                       padding = 5
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
                       foreground = colors[7],
                       padding = 2,
                       fontsize = 12
                       ),
              widget.Volume(
                       foreground = colors[7],
                       background = colors[0],
                       fmt = '{}',
                       padding = 5,
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
                       foreground = colors[10],
                       padding = 2,
                       fontsize = 12
                       ),
              widget.Clock(
                       foreground = colors[10],
                       background = colors[0],
                       format = "%H:%M "
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
                       foreground = colors[9],
                       padding = 2,
                       fontsize = 12
                       ),
              widget.Clock(
                       foreground = colors[9],
                       background = colors[0],
                       format = '%d/%m/%y '
                       ),
              widget.TextBox(
                       text = '',
                       font = "Font Awesome 6 Free",
                       background = colors[0],
                       foreground = colors[4],
                       padding = 2,
                       fontsize = 12
                       ),
              widget.Battery(
                       foreground = colors[4],
                       background = colors[0],
                       format = '{percent:2.0%}',
                       update_interval = 10
                       ),
              widget.Systray(
                       background = colors[0],
                       foreground = colors[2],
                       padding = 6,
                       icon_size=15,
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[2],
                       background = colors[0],
                       padding = 3,
                       scale = 0.65
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              ]
    return widgets_list


if __name__ in ["config", "__main__"]:
    screens = [Screen(top=bar.Bar(widgets=init_widgets_list(), opacity=1.0, size=22))]
    widgets_list = init_widgets_list()

def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False


floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),      # tastyworks exit box
    Match(title='Qalculate!'),        # qalculate-gtk
    Match(wm_class='megasync'),       # megasync
    Match(wm_class='Pavucontrol'),    # pavucontrol
    # Match(wm_class='pinentry-gtk-2'), # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])



wmname = "LG3D"
