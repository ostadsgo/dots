from libqtile import bar, widget
from libqtile.config import Screen

from . import color as c

# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg, fg):
    return widget.TextBox(
        text="", padding=-5, fontsize=26, background=bg, foreground=fg
    )


def left_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="", padding=0, fontsize=26, background=bg_color, foreground=fg_color
    )


def right_arrow(bg, fg):
    return widget.TextBox(
        text="", padding=0, fontsize=26, background=bg, foreground=fg
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
    right_arrow(c.dark, c.secondary),
    right_arrow(fg=c.dark, bg=c.primary),
    widget.Clock(
        background=c.primary,
        format="%d %b %A | %H:%M",
        padding=5,
    ),
    # Current Layout
    # --------------
    right_arrow(c.bg, c.primary),
    widget.Spacer(),
    # Worksapces
    # --------------
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        active=c.active,
        inactive=c.inactive,
        this_current_screen_border=c.primary,
        urgent_border=c.secondary,
        urget_text=c.fg,
    ),
    widget.Spacer(),
    left_arrow(c.bg, c.primary),
    widget.KeyboardLayout(configured_keyboards=["us", "ir"], background=c.primary),
    widget.Volume(background=c.primary, padding=10),
    widget.Net(
        prefix="k",
        background=c.primary,
        padding=10,
        format="{interface} |{down:.2}KB ↓↑{up:.2}KB",
    ),
    left_arrow(c.primary, c.primary),
    left_arrow(c.primary, c.dark),
    left_arrow(c.dark, c.secondary),
    widget.QuickExit(background=c.secondary, fmt="OFF", padding=5),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c.bg, size=20, opacity=1)
bar2 = bar.Bar(bar_widgets2, background=c.bg, size=24)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)
