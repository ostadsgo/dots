from modules import binding
from modules import core
from modules import hooks

# ---------------
#   Bindings
# ---------------
keys = binding.keys
mouse = binding.mouse

# ---------------
#   Core
# ---------------
groups = core.groups
layouts = core.layouts
floating_layout = core.floating_layout
widget_defaults = core.widget_defaults
extension_defaults = core.extension_defaults
screens = [core.screen1, core.screen2]

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

hooks.autostart()
