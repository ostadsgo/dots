import os
import subprocess

from libqtile import hook, qtile

# Autostart function
@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.local/bin/scripts/autostart")
    subprocess.call(script)


@hook.subscribe.client_new
def send_to_group(client):
    """Open spcific programs on disired group"""
    if client.window.get_wm_class()[1] == "firefox":
        client.togroup("2")


@hook.subscribe.setgroup
def on_group_change():
    # qtile.current_group.label = "\uf62e"
    pass
