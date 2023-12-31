from libqtile import bar, widget
from libqtile.config import Screen

from .colors import NoClown as c


# ---------------------
#    SCREEN WIDGETS
#    Shapes:        
# ---------------------
def sep(bg, pad=5):
    return widget.Sep(background=bg, padding=pad, linewidth=0)


def left_sep(bg: str, fg: str, shape="\ue0b8", padding=0, fontsize=24):
    return widget.TextBox(
        text=shape, padding=padding, fontsize=fontsize, background=bg, foreground=fg
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
    sep(bg=c.bg, pad=3),
    widget.CurrentLayout(
        background=c.fg,
        foreground=c.bg,
        padding=10,
    ),
    sep(bg=c.bg),
    widget.WindowCount(
        background=c.secondary,
        foreground=c.bg,
    ),
    widget.Spacer(),
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        active=c.active,
        inactive=c.inactive,
        this_current_screen_border=c.primary,
    ),
    widget.Spacer(),
    widget.Net(
        prefix="M",
        background=c.secondary,
        foreground=c.bg,
        padding=10,
        format="{down:1.2f}{down_suffix} ↓↑ {up:1.2f}{up_suffix}",
    ),
    sep(bg=c.bg),
    widget.KeyboardLayout(
        background=c.primary,
        foreground=c.bg,
        configured_keyboards=["us", "ir"],
        padding=10,
    ),
    sep(bg=c.bg),
    widget.Volume(
        background=c.active,
        foreground=c.bg,
        padding=10,
    ),
    sep(bg=c.bg),
    widget.Clock(
        background=c.fg,
        foreground=c.bg,
        format="%H:%M",
        padding=10,
    ),
    sep(bg=c.bg, pad=3),
]

# Bars
bar_widgets = bar_widgets.copy()
bar = bar.Bar(bar_widgets, background=c.bg, size=20, opacity=0.9)

# Screens
screen = Screen(top=bar)
