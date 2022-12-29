"""
Bars or panel for my qtile.
Each bar is a python class to order to use 
them the only thing to do is create a object from
desired bar in base.py
"""
from libqtile.bar import Bar


class Cut(Bar):
    """Bar with cuted each."""

    def __init__(self, widgets, size, **cfg):
        super().__init__(widgets, size, **cfg)
