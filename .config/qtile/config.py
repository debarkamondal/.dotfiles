import os
import subprocess
from libqtile import hook
from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from libqtile.log_utils import logger
mod = "mod4"
terminal = guess_terminal()

keys = [
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "space", lazy.layout.next(),
            desc="Move window focus to other window"),

        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
            desc="Move window to the left"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
            desc="Move window to the right"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
            desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([mod, "control"], "h", lazy.layout.grow_left(),
            desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(),
            desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(),
            desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack"),
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

        # Toggle between different layouts as defined below
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

        Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key([mod], "r", lazy.spawncmd(),
            desc="Spawn a command using a prompt widget"),
        ]

group_names = [("WWW", {'layout': 'monadtall'}),
        ("VM", {'layout': 'monadtall'}),
        ("MUS", {'layout': 'monadtall'}),
        ("GFX", {'layout': 'floating'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
        keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {"border_width": 2,
        "margin": 4,
        "border_focus": "e1acff",
        "border_normal": "1D2330"
        }


layouts = [
        # layout.Columns(border_focus_stack='#d75f5f'),
        layout.Max(**layout_theme),
        # Try more layouts by unleashing below layouts.
        # layout.Stack(num_stacks=2),
        # layout.Bsp(),
        # layout.Matrix(),
        layout.MonadTall(**layout_theme),
        layout.MonadWide(**layout_theme)
        # layout.RatioTile(),
        # layout.Tile(),
        # layout.TreeTab(),
        # layout.VerticalTile(),
        # layout.Zoomy(),
        ]

colors = [["#282c34", "#282c34"], # panel background
        ["#3d3f4b", "#434758"], # background for current screen tab
        ["#ffffff", "#ffffff"], # font color for group names
        ["#ff5555", "#ff5555"], # border line color for current tab
        ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
        ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
        ["#e1acff", "#e1acff"], # window name
        ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens

#prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())


widget_defaults = dict(
        font='FiraCode Nerd Font',
        fontsize=13,
        padding=2,
        )
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
            widget.Sep(
                linewidth = 0,
                padding = 6,
                ),

            widget.GroupBox(
                font = "Ubuntu Bold",
                fontsize = 10,
                margin_y = 5,
                margin_x = 5,
                padding_y = 0,
                padding_x = 3,
                borderwidth = 3,
                active = colors[2],
                inactive = colors[7],
                rounded = True,
                #                    highlight_color = colors[1],
                highlight_method = "line",
                this_current_screen_border = colors[6],
                this_screen_border = colors [4],
                other_current_screen_border = colors[6],
                other_screen_border = colors[4],
                foreground = colors[2],
                ),
            widget.Prompt(),
            widget.WindowName(),
            widget.Chord(
                chords_colors={
                    'launch': ("#ff0000", "#ffffff"),
                    },
                name_transform=lambda name: name.upper(),
                ),
            widget.Systray(),
            widget.TextBox(
                text = '',
                #                    background = colors[5],
                foreground = colors[5],
                padding = 0,
                fontsize = 26
                ),
            widget.Net(
                interface = "enp42s0",
                format = '{down} ↓↑ {up}',
                foreground = colors[2],
                background = colors[5],
                padding = 5
                ),
            widget.TextBox(
                text = '',
                background = colors[5],
                foreground = colors[4],
                padding = 0,
                fontsize = 26
                ),
            widget.TextBox(
                    text = " ⟳",
                    padding = 5,
                    foreground = colors[2],
                    background = colors[4],
                    fontsize = 14
                    ),
            widget.CheckUpdates(
                    update_interval = 1800,
                    distro = "Arch",
                    display_format = "{updates} Updates",
                    foreground = colors[2],
                    #                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
                    background = colors[4]
                    ),
            widget.TextBox(
                    text = '',
                    background = colors[4],
                    foreground = colors[5],
                    padding = 0,
                    fontsize = 26
                    ),
            widget.Clock(
                    foreground = colors[2],
                    background = colors[5],
                    format='%I:%M %p'
                    ),
            widget.TextBox(
                    text = '',
                    background = colors[5],
                    foreground = colors[4],
                    padding = 0,
                    fontsize = 26
                    ),
            widget.CurrentLayout(
                    background = colors[4],
                    padding = 0,
                    ),
            widget.Sep(
                    linewidth = 0,
                    padding = 9,
                    background = colors[4]
                    ),
            ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
        return widgets_screen1



def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), margin=3, opacity=0.55, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
        widgets_list = init_widgets_list()
        widgets_screen1 = init_widgets_screen1()


# Drag floating layouts.
mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(),
            start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(),
            start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front())
        ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='xdman-Main'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    ])
auto_fullscreen = True
focus_on_window_activation = "smart"


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.


wmname = "LG3D"
