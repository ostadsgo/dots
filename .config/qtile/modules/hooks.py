import os
import subprocess
import random 
from libqtile import hook, qtile

# Autostart function
@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.local/bin/scripts/autostart")
    subprocess.call(script)


@hook.subscribe.client_focus
def on_client_focus(window):
    # windows = window._group.windows
    # for win in windows:
    #     win.borderwidth = 0
    #     os.system(f"notify-send '{win.name}' ")
    #     os.system(f"notify-send '{dir(win)}' ")
    # os.system(f"notify-send winwin'{dir(window.window)}'")
    pass
