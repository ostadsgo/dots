import os

# Modifiers
SUPER = "mod4"
MOD1 = "mod1"

# shortcut set
WIN = ["mod4"]
ALT = ["mod1"]
WIN_SHT = ["mod4", "shift"]
WIN_CTRL = ["mod4", "control"]

TERMINAL = os.environ.get("TERMINAL") or "kitty"


def color(colorscheme=None):
    # defualt colorscheme if color scheme not provided
    return {
        # black
        "black0": colorscheme["color0"],
        "black1": colorscheme["color8"],
        # red
        "red0": colorscheme["color1"],
        "red1": colorscheme["color9"],
        # green
        "green0": colorscheme["color2"],
        "green1": colorscheme["color10"],
        # yellow
        "yellow0": colorscheme["color3"],
        "yellow1": colorscheme["color11"],
        # blue
        "blue0": colorscheme["color4"],
        "blue1": colorscheme["color12"],
        # magenta
        "magenta0": colorscheme["color5"],
        "magenta1": colorscheme["color13"],
        # cyan
        "cyan0": colorscheme["color6"],
        "cyan1": colorscheme["color14"],
        # white
        "white0": colorscheme["color7"],
        "white1": colorscheme["color15"],
    }


gruvbox = {
    # black
    "color0": "#272727",
    "color8": "#928373",
    # red
    "color1": "#cc231c",
    "color9": "#fb4833",
    # green
    "color2": "#989719",
    "color10": "#b8ba25",
    # yellow
    "color3": "#d79920",
    "color11": "#fabc2e",
    # blue
    "color4": "#448488",
    "color12": "#83a597",
    # magenta
    "color5": "#b16185",
    "color13": "#d3859a",
    # cyan
    "color6": "#689d69",
    "color14": "#8ec07b",
    # white
    "color7": "#a89983",
    "color15": "#ebdbb2",
}


onedark = {
    # black
    "color0": "#282c34",
    "color1": "#e06c75",
    # red
    "color2": "#98c379",
    "color3": "#e5c07b",
    # green
    "color4": "#61afef",
    "color5": "#be5046",
    # yellow
    "color6": "#56b6c2",
    "color7": "#979eab",
    # blue
    "color8": "#393e48",
    "color9": "#d19a66",
    # magenta
    "color10": "#56b6c2",
    "color11": "#e5c07b",
    # cyan
    "color12": "#61afef",
    "color13": "#be5046",
    # white
    "color14": "#56b6c2",
    "color15": "#abb2bf",
}

tokyonight = {
    # Black
    "color0": "#414868",
    "color8": "#414868",
    # Red
    "color1": "#f7768e",
    "color9": "#f7768e",
    # Green
    "color2": "#73daca",
    "color10": "#73daca",
    # Yellow
    "color3": "#e0af68",
    "color11": "#e0af68",
    # Blue
    "color4": "#7aa2f7",
    "color12": "#7aa2f7",
    # Magenta
    "color5": "#bb9af7",
    "color13": "#bb9af7",
    # Cyan
    "color6": "#7dcfff",
    "color14": "#7dcfff",
    # White
    "color7": "#c0caf5",
    "color15": "#c0caf5",
}
