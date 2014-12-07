#!/usr/bin/env python
"""
This script will bootstrap dotfiles such as vim, or tmux
"""

import os
from scripts import DirHelper as dh
from scripts import Dotfile as df

def main():
    """
    This is the main function for bootstraping
    """

    cwd = os.getcwd()

    dotfiles = dh.get_dirs_trimmed(cwd)

    for dotfile in dotfiles:
        dotty = df.Dotfile(dotfile)
        dotty.print_files()
        dotty.print_dirs()

if __name__ == "__main__":
    main()
