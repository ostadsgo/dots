from libqtile import layout
from libqtile.config import Group, Match, ScratchPad, DropDown

# ------------------
#     GROUP
# ------------------
# keyword arguments for `python` scratchpad
spad_kw = dict(x=0.16, y=0.1, width=0.7, height=0.7, opacity=0.7)
groups = [
    Group(name="1", label=" "),
    Group(
        name="2",
        label=" ",
        layout="max",
        matches=[
            Match(wm_class="firefox"),
            Match(wm_class="microsoft-edge"),
        ],
    ),
    Group(name="3", label=" ", layout="monadtall"),
    Group(name="9", label="  "),
    Group(name="0", label=" "),
    ScratchPad(
        "scratchpad",
        [
            DropDown("python", "kitty -e python", **spad_kw),
            DropDown("terminal", "kitty", **spad_kw),
        ],
    ),
]


# ------------------
#     LAYOUTS
# ------------------
layout_config = dict(
    margin=1,
    border_width=2,
    border_focus="#ffffffff",
    border_normal="#00000000",
    border_focus_stack="#e0af68",
    border_normal_stack="#00000000",
    single_border_width=0,
)

layouts = [
    layout.Columns(**layout_config, insert_position=1),
    layout.Max(),
    layout.MonadTall(ratio=0.65, max_ratio=0.75, **layout_config),
    layout.MonadWide(**layout_config, ratio=0.65),
]

# ---------------------
#    Floating Layout
# ---------------------
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="tk"),  # tkinter
        Match(wm_class="pcmanfm"),  # tkinter
        Match(wm_class="xarchiver"),  # tkinter
        Match(wm_class="Toplevel"),  # tkinter toplevel window
        Match(wm_class="Places"),  # Firefox download window
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    **layout_config,
)
