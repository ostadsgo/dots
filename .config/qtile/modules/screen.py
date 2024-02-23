from libqtile import bar, widget
from libqtile.config import Screen

color = {
    "bg": "#151515",
    "fg": "#E1E1E1",
    "active": "#727272",
    "inactive": "#373737",
    "primary": "#BAD7FF",
    "secondary": "#b46958",
}


# ---------------------
#    SCREEN WIDGETS
#    Shapes:        
# ---------------------
def sep(bg, pad=5):
    return widget.Sep(background=bg, padding=pad, linewidth=0)


widget_defaults = dict(
    font="Noto Sans Mono",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        background=color.get("inactive", "#ff0000"),
        active=color.get("active", "#ff0000"),
        inactive=color.get("active", "#ff0000"),
        this_current_screen_border=color.get("fg", "#ff0000"),
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.CurrentLayout(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.WindowCount(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
    ),
    widget.Spacer(),
    widget.Net(
        prefix="M",
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        padding=10,
        format="{down:1.2f}{down_suffix} ↓↑ {up:1.2f}{up_suffix}",
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.KeyboardLayout(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        configured_keyboards=["us", "ir"],
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.Volume(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.Clock(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        format="%H:%M",
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.Systray(),
]

# Bars
bar_widgets = bar_widgets.copy()
bar = bar.Bar(bar_widgets, background=color.get("bg", "#ff0000"), size=20, opacity=1)

# Screens
screen = Screen(bottom=bar)
