from libqtile.utils import send_notification
from modules import bindings, core, screen

from libqtile import hook
from libqtile import qtile

# ---------------
#   Bindings
# ---------------
keys = bindings.keys
mouse = bindings.mouse

# ---------------
#   Core
# ---------------
groups = core.groups
layouts = core.layouts
floating_layout = core.floating_layout
widget_defaults = screen.widget_defaults
extension_defaults = screen.extension_defaults
screens = [screen.screen]

# ---------------
# Defult settings
# ---------------
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "Qtile"


# ---------------
# Hooks
# ---------------
@hook.subscribe.float_change
def float_change():
    window = qtile.current_window
    is_maximized = window.info().get("maximized")
    if not is_maximized:
        window.center()
