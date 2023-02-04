from libqtile.config import Drag, Click
from libqtile.lazy import lazy

# shortcut set
WIN = ["mod4"]


# Mouse bindings
mouse = [
    Drag(
        WIN,
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        WIN,
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click(WIN, "Button2", lazy.window.bring_to_front()),
]
