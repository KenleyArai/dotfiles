"""
This lib is to help get only the files needed and wanted for bootstraping
"""
import os

def prepend_path(path, filename):
    """
    Will connect cwd with filenames
    """
    return path + "/" + filename

def dir_helper_listdir(path):
    """
    List dir with full path
    """
    return [prepend_path(path, name) for name in os.listdir(path)]

def get_dirs_only(dirs_with_files):
    """
    Gets only the dirs from a directory
    """
    return [name for name in dirs_with_files if os.path.isdir(name)]

def get_dirs(path):
    """
    getting all dirs in the root directory
    """
    return get_dirs_only(dir_helper_listdir(path))

def get_files_only(dirs_with_files):
    """
    Gets only the files from a directory
    """
    return [name for name in dirs_with_files if os.path.isfile(name)]

def get_files(path):
    """
    getting all dirs in the root directory
    """
    return get_files_only(dir_helper_listdir(path))


def get_dirs_trimmed(path):
    """
    getting all dirs in the root directory
    """
    # get only dir in cwd
    all_dirs = get_dirs(path)

    bootstrap = [".git", "scripts", "tests"]
    bootstrap = [prepend_path(path, name) for name in bootstrap]

    # remove dirs apart of the bootstrap
    for name in bootstrap:
        if os.path.isdir(name):
            all_dirs.remove(name)

    return all_dirs

def get_home():
    """
    gets path of home directory
    """
    return os.path.expanduser("~")
