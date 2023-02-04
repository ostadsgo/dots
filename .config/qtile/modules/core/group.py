from libqtile.config import Group, Match, ScratchPad, DropDown

# ------------------
#     GROUP
# ------------------
# keyword arguments for `python` scratchpad 
spad_kw = dict(x=.16, y=.1, width=.7, height=.7, opacity=0.8)
groups = [
    Group(name="1", label=" "),
    Group(name="2", label=" ", layout="max", matches=[Match(wm_class="firefox")]),
    Group(name="3", label=" ", layout="monadtall"),
    Group(name="9", label="  "),
    Group(name="0", label=" "),
    ScratchPad(
        "scratchpad",
        [DropDown("python", "kitty -e python", **spad_kw)],
    ),
]
