from os import system

from libqtile import hook

from modules import bindings, core, screen

# from libqtile.utils import send_notification

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


# @hook.subscribe.client_focus
# def client_focus(windows):
#     pass


# @hook.subscribe.layout_change
# def layout_change(layout, _):
#     PICOM_PATH = "~/.config/picom"
#     if layout.name == "max":
#         system(f"cp {PICOM_PATH}/no-corner.conf {PICOM_PATH}/picom.conf")
#     else:
#         system(f"cp {PICOM_PATH}/corner.conf {PICOM_PATH}/picom.conf")
