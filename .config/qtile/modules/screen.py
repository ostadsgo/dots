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
    widget.CurrentLayout(
        background=c.inactive,
        foreground=c.fg,
        padding=10,
    ),
    sep(bg=c.bg, pad=1),
    widget.WindowCount(
        background=c.inactive,
        foreground=c.fg,
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
        background=c.inactive,
        foreground=c.fg,
        padding=10,
        format="{down:1.2f}{down_suffix} ↓↑ {up:1.2f}{up_suffix}",
    ),

    sep(bg=c.bg, pad=1),
    widget.KeyboardLayout(
        background=c.inactive,
        foreground=c.fg,
        configured_keyboards=["us", "ir"],
        padding=10,
    ),
    sep(bg=c.bg, pad=1),
    widget.Volume(
        background=c.inactive,
        foreground=c.fg,
        padding=10,
    ),
    sep(bg=c.bg, pad=1),
    widget.Clock(
        background=c.inactive,
        foreground=c.fg,
        format="%H:%M",
        padding=10,
    ),
    sep(bg=c.bg, pad=1),
    widget.Systray(),

]

# Bars
bar_widgets = bar_widgets.copy()
bar = bar.Bar(bar_widgets, background=c.bg, size=20, opacity=0.99)

# Screens
screen = Screen(bottom=bar)
