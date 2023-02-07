from libqtile import  bar, widget
from libqtile.config import Screen

from . import color as c
# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg):
    return widget.Sep(background=bg, padding=10, linewidth=0)


def left_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="", padding=0, fontsize=26, background=bg_color, foreground=fg_color
    )


def right_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="", padding=0, fontsize=26, background=bg_color, foreground=fg_color
    )

widget_defaults = dict(
    font="IBM Plex Mono Medm",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    sep(c.secondary),
    # Date
    # --------------
    widget.CurrentLayout(background=c.secondary, padding=10),
    right_arrow(c.primary, c.secondary),
    widget.Clock(
        background=c.primary,
        format="%d %b %A | %H:%M",
        padding=5,
    ),
    # Current Layout
    # --------------
    right_arrow(c.black, c.primary),
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
    left_arrow(c.black, c.primary),
    widget.KeyboardLayout(configured_keyboards=["us", "ir"], background=c.primary),
    widget.Volume(background=c.primary, padding=10),
    widget.Net(
        prefix="k",
        background=c.primary,
        padding=10,
        format="{interface} |{down:.2}KB ↓↑{up:.2}KB"
    ),
    left_arrow(c.primary, c.secondary),
    widget.QuickExit(background=c.secondary, fmt="OFF", padding=5),
    sep(c.secondary),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c.black, size=20, opacity=.9)
bar2 = bar.Bar(bar_widgets2, background=c.black, size=24)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)
