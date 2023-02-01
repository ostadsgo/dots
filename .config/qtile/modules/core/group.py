from libqtile.config import Group, Match
# ------------------
#     GROUP
# ------------------
groups = [
    Group(name="1", label=" "),
    Group(name="2", label=" ", layout="max", matches=[Match(wm_class="firefox")]),
    Group(name="3", label=" ", layout="monadtall"),
    Group(name="9", label="  "),
    Group(name="0", label=" "),
]

