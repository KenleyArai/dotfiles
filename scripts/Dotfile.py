"""
This class is a datastructure meant to hold a dotfiles informantion
"""
import os
import scripts.DirHelper as DH

class Dotfile(object):
    """
    Dotfile class
    """

    def __init__(self, directory):
        self.home  = DH.get_home()
        self.files = DH.get_files(directory)
        self.dirs  = DH.get_dirs(directory)
        self.check_backup_file()

    def check_backup_file(self):
        """
        Checks to see if backup directory exists at
        $HOME/old_dotfiles.
        If it doesn't it creates the directory
        """
        if not os.path.exists(self.home + "/old_dotfiles"):
            os.makedirs(self.home + "/old_dotfiles")

    def print_files(self):
        """
        Prints all files discovered
        """
        print ", ".join(self.files)

    def print_dirs(self):
        """
        Prints all dirs discovered
        """
        print ", ".join(self.dirs)
