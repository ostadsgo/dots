"""
Colors to using in various part of qtile.
Each color is a python dict with key value pair of color number and color value.
The `color` function gets a dict and return a dict with color name and color value. 

Adding a new color is easy, just create a dict with 16 base color system.
"""


def color(colorscheme):
    """Return color name and color value as a dict"""
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

# 3024dark
t_3024dark = {
    # black
    "color0": "#090200",
    "color8": "#5b5754",
    # Red
    "color1": "#da2c20",
    "color9": "#e8bacf",
    # Green
    "color2": "#00a152",
    "color10": "#3a3332",
    # Yellow
    "color3": "#fcec02",
    "color11": "#494542",
    # Blue
    "color4": "#00a0e4",
    "color12": "#7f7c7b",
    # Magenta
    "color5": "#a06994",
    "color13": "#d6d4d3",
    # Cyan
    "color6": "#b5e4f4",
    "color14": "#ccab53",
    # White
    "color7": "#a4a1a1",
    "color15": "#f7f7f7",
}

tomorrow = {
    # black
    "color0": "#000000",
    "color8": "#424242",
    # red
    "color1": "#d44d53",
    "color9": "#d44d53",

    # green
    "color2": "#b9c949",
    "color10": "#b9c949",

    # yellow
    "color3": "#e6c446",
    "color11": "#e6c446",

    # blue
    "color4": "#79a6da",
    "color12": "#79a6da",

    # magenta
    "color5": "#c396d7",
    "color13": "#c396d7",

    # cyan
    "color6": "#70c0b1",
    "color14": "#70c0b1",

    # white
    "color7": "#fffefe",
    "color15": "#fffefe",
}
