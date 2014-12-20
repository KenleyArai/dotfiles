#!/bin/bash

#Dotfiles that will be bootstrapped
DOTFILES=('vim' 'tmux' 'bash')

link_file() {

    local SRC=$1
    local DST=$2

    if [ -d $DST -o -f $DST -o -L $DST ]
    then
        if [ ! -d ~/old_dotfiles ]
        then
            echo "Creating backup file ~/old_dotfiles"
            mkdir ~/old_dotfiles
        fi
        echo "Backing up " $DST
        mv $DST ~/old_dotfiles/
    fi
    ln -s $SRC $DST
}

link_dotfile() {
    local DF=$1
    local DIRS=($(ls -d $DF/*/))
    local FILES=($(find $DF -maxdepth 1 -type f))

    for file in ${DIRS[@]}
    do
        local src=$PWD"/"${file%/}
        local dst=$HOME"/."${file#*/*}
        dst=${dst%/}

        printf '%s -> %s\n' $src $dst
        link_file $src $dst
    done

    for file in ${FILES[@]}
    do
        local src=$PWD"/"$file
        local dst=$HOME"/."${file##*/}

        printf '%s -> %s\n' $src $dst
        link_file $src $dst
    done

    printf '\n'
}

for FILE in "${DOTFILES[@]}"
do
    link_dotfile $FILE
done

link_dotfile dir_colors
link_dotfile gitconfig

source vim/install.sh
