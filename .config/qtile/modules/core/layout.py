from libqtile import layout
from libqtile.config import Match

# ------------------
#     LAYOUTS
# ------------------
layouts = [
    layout.Columns(
        margin=3,
        border_width=0,
    ),
    layout.MonadTall(
        ratio=0.65,
        max_ratio=0.75,
        single_border_width=0,
        border_width=0,
        margin=3,
    ),
    layout.Max(),
]

# ---------------------
#    Floating Layout
# ---------------------
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="tk"),  # tkinter
        Match(wm_class="Toplevel"),  # tkinter toplevel window
        Match(wm_class="Places"),  # Firefox download window
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=0,
)
