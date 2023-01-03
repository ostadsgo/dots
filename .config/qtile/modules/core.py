from libqtile import layout, bar, widget
from libqtile.config import Screen, Group, Match


from .colors import color, gruvbox


# color for layout and screen widgets
c = color(gruvbox)

# ------------------
#     GROUP
# ------------------
groups = [
    Group(name="1", label=" "),
Group(name="2", label=" ", layout="max", matches=[Match(wm_class="firefox")]),
Group(name="3", label=" ", layout="monadtall"),
Group(name="9", label="  "),
Group(name="0", label=" "),
]

# ------------------
#     LAYOUTS
# ------------------
layouts = [
    layout.Columns(
        border_focus=c["green0"],
        border_normal=c["black0"],
        border_width=2,
        border_focus_stack=c["green0"],
        border_normal_stack=c["cyan0"],
        margin=5,
    ),

    layout.MonadTall(
        border_focus=c["green0"],
        border_normal=c["black0"],
        max_ratio=.65,
        single_border_width=0,
        border_width=2,
        margin=5,
    ),

        layout.Max(),
]

# ---------------------
#    Floating Layout
# ---------------------
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="tk"),  # tkinter
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus=c["white0"],
    border_normal=c["black0"],
    border_width=2,
)

# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg):
    return widget.Sep(background=bg, padding=10, linewidth=0)


def python_icon(bg_color, fg_color):
    return widget.TextBox(
        text="\ue235", padding=0, fontsize=24, background=bg_color, foreground=fg_color
    )


def left_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="\ue0b8", padding=0, fontsize=24, background=bg_color, foreground=fg_color
    )


def right_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="\uE0Ba", padding=0, fontsize=24, background=bg_color, foreground=fg_color
    )


widget_defaults = dict(
    font="IBM Plex Mono Medm",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    sep(c["blue0"]),
    # Date
    # --------------
    widget.Clock(
        foreground=c["white1"], background=c["blue0"], format="%d %b | %A", padding=5
    ),
    left_arrow(c["magenta0"], c["blue0"]),
    # Current Layout
    # --------------
    widget.CurrentLayout(background=c["magenta0"], padding=10),
    left_arrow(c["black0"], c["magenta0"]),
    widget.Spacer(),
    # Worksapces
    # --------------
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        active=c["white1"],    # Not empty WS
        inactive=c["white0"],  # Empty WS
        this_current_screen_border=c["green1"], # Current working ws
        urgent_border=c["black0"],
        urget_text=c["red1"]
    ),
    widget.Spacer(),
    right_arrow(c["black0"], c["magenta0"]),
    widget.Volume(background=c["magenta0"], padding=10),
    right_arrow(c["magenta0"], c["blue0"]),
    widget.Clock(background=c["blue0"], padding=10),
    right_arrow(c["blue0"], c["red1"]),
    widget.QuickExit(background=c["red1"], fmt="OFF", padding=5),
    sep(c["red1"]),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c["black0"], size=20)
bar2 = bar.Bar(bar_widgets2, background=c["black0"], size=24)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)
