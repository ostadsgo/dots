from libqtile import bar, widget
from libqtile.config import Screen

from .colors import Moonfly as c


# ---------------------
#    SCREEN WIDGETS
#    Shapes:       
# ---------------------
def sep(bg, pad=2):
    return widget.Sep(background=bg, padding=pad, linewidth=0)


def left_sep(bg, fg, shape="\ue0b8"):
    return widget.TextBox(
        text=shape, padding=-1, fontsize=24, background=bg, foreground=fg
    )


def right_sep(bg, fg, shape="\uE0Ba"):
    return widget.TextBox(
        text=shape, padding=-1, fontsize=24, background=bg, foreground=fg
    )


widget_defaults = dict(
    font="Noto Sans Mono",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    # --------------
    # Layout / Date / Win count
    # --------------
    widget.CurrentLayout(background=c.primary, foreground=c.bg, padding=10),
    left_sep(bg=c.active, fg=c.primary),
    left_sep(bg=c.inactive, fg=c.active),
    widget.Clock(
        background=c.inactive,
        foreground=c.active,
        format="%d %b %A | %H:%M",
        padding=10,
    ),
    left_sep(bg=c.bg, fg=c.inactive),
    # --------------
    # Current Layout
    # --------------
    sep(bg=c.bg),
    widget.Spacer(),
    # --------------
    # Worksapces
    # --------------
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        active=c.active,
        inactive=c.inactive,
        this_current_screen_border=c.primary,
    ),
    widget.Spacer(),
    widget.WindowCount(background=c.secondary, foreground=c.bg),
    sep(bg=c.bg),
    widget.KeyboardLayout(
        background=c.inactive,
        foreground=c.active,
        configured_keyboards=["us", "ir"],
        padding=10,
    ),
    sep(bg=c.bg),
    widget.Net(
        prefix="M",
        background=c.inactive,
        foreground=c.active,
        padding=10,
        format="{down:1.2f}{down_suffix} ↓↑ {up:1.2f}{up_suffix}",
    ),
    sep(bg=c.bg),
    widget.Volume(background=c.inactive, foreground=c.active, padding=10),
    sep(bg=c.bg),
    widget.QuickExit(background=c.primary, foreground=c.bg, fmt="OFF", padding=10),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c.bg, size=20, opacity=0.9)
bar2 = bar.Bar(bar_widgets2, background=c.bg, size=20)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)
