from libqtile import bar, widget
from libqtile.config import Screen

from .colors import Rosepine as c


# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg):
    return widget.Sep(background=bg, padding=10, linewidth=0)


def left_arrow(bg, fg):
    return widget.TextBox(
        text="\ue0b8", padding=-1, fontsize=24, background=bg, foreground=fg
    )


def right_arrow(bg, fg):
    return widget.TextBox(
        text="\uE0Ba", padding=-1, fontsize=24, background=bg, foreground=fg
    )


widget_defaults = dict(
    font="Cascadia Code",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    # Date
    # --------------
    widget.CurrentLayout(background=c.primary, padding=10),
    sep(bg=c.bg),
    widget.Clock(
        background=c.bg,
        format="%d %b %A | %H:%M",
        padding=10,
    ),
    # Current Layout
    # --------------
    sep(bg=c.bg),
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
    widget.Net(
        prefix="M",
        background=c.bg,
        padding=10,
        format="{down:1.2f}{down_suffix} ↓↑ {up:1.2f}{up_suffix}",
        # format="{down:6.2}KB ↓↑{up:6.2}KB",
    ),
    widget.Volume(background=c.bg, padding=10),
    widget.KeyboardLayout(
        configured_keyboards=["us", "ir"], background=c.bg, padding=10
    ),
    sep(bg=c.bg),
    widget.QuickExit(background=c.primary, fmt="OFF", padding=10),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c.bg, size=20, opacity=0.8)
bar2 = bar.Bar(bar_widgets2, background=c.bg, size=24)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)
