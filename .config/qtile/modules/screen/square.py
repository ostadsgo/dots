from libqtile import bar, widget
from libqtile.config import Screen

from . import colors

c = colors.Minimal
# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg):
    return widget.Sep(background=bg, padding=10, linewidth=0)


def left_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="\ue0b8", padding=-1, fontsize=24, background=bg_color, foreground=fg_color
    )


def right_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="\uE0Ba", padding=-1, fontsize=24, background=bg_color, foreground=fg_color
    )


widget_defaults = dict(
    font="IBM Plex Mono Medm",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    # Date
    # --------------
    widget.CurrentLayout(background=c.secondary, padding=10),
    sep(bg=c.black),
    widget.Clock(
        background=c.primary,
        format="%d %b %A | %H:%M",
        padding=10,
    ),
    # Current Layout
    # --------------
    sep(bg=c.black),
    widget.Spacer(),
    # Worksapces
    # --------------
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        active=c.silver,
        inactive=c.gray,
        this_current_screen_border=c.primary,
        urgent_border=c.secondary,
        urget_text=c.light,
    ),
    widget.Spacer(),
    widget.KeyboardLayout(
        configured_keyboards=["us", "ir"], background=c.primary, padding=10
    ),
    widget.Volume(background=c.primary, padding=10),
    widget.Net(
        prefix="k",
        background=c.primary,
        padding=10,
        format="{interface} |{down:.2}KB ↓↑{up:.2}KB",
    ),
    sep(bg=c.black),
    widget.QuickExit(background=c.secondary, fmt="OFF", padding=10),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c.black, size=20, opacity=0.9)
bar2 = bar.Bar(bar_widgets2, background=c.black, size=24)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)
