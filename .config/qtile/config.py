from modules.bindings import keymap
from modules.bindings import mousemap
from modules.core import group, layout
from modules.screen import screen



# ---------------
#   Bindings
# ---------------
keys = keymap.keys
mouse = mousemap.mouse

# ---------------
#   Core
# ---------------
groups = group.groups
layouts = layout.layouts
floating_layout = layout.floating_layout
widget_defaults = screen.widget_defaults
extension_defaults = screen.extension_defaults
screens = [screen.screen1, screen.screen2]

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

