import os
import subprocess
import random 
from libqtile import hook, qtile


windows = None

# Autostart function
@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.local/bin/scripts/autostart")
    subprocess.call(script)


@hook.subscribe.group_window_add
def on_new_window(group, window):
    global windows
    windows = group.windows


@hook.subscribe.client_focus
def on_client_focus(window):
    # os.system("notify-send 'hello'")
    global windows
    for win in windows:
        os.system(f"notify-send '{win.borderwidth}' ")
        win.borderwidth = 10


# Note: hooks works but doesn't change the borderwidth
# When put scripts on autostart qtile got crashed
# Adding scripts to autostart have adventages but I need
# to find to know how to write them!!
