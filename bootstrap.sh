#!/bin/bash

#Dotfiles that will be bootstrapped
DOTFILES=('vim' 'tmux' 'xmonad' 'bash')

link_file() {

    local OLD=$1
    local NEW=$2

    if [ -d $NEW -o -f $NEW -o -L $NEW ]
    then
        if [ ! -d ~/old_dotfiles ]
        then
            echo "Creating backup file ~/old_dotfiles"
            mkdir ~/old_dotfiles
        fi
        echo "Backing up " $NEW
        mv $NEW ~/old_dotfiles
    fi

    echo "Symlinking " $OLD " to " $NEW
    ln -s $OLD $NEW
}

link_dotfile() {
    local DF=$1
    local DIRS=($(ls -d $DF/*/))
    local FILES=($(find $DF -maxdepth 1 -type f))

    for file in ${DIRS[@]}
    do
        local of=$HOME"/."${file#*/*}
        local lf=$PWD"/"${file%/}
        lf=${lf%/}

        printf '%s -> %s\n' $lf $of
        link_file $of $lf
    done

    for file in ${FILES[@]}
    do
        local of=$HOME"/."${file##*/}
        local lf=$PWD"/"$file

        printf '%s -> %s\n' $lf $of
        link_file $lf $of
    done

}

for FILE in "${DOTFILES[@]}"
do
    link_dotfile $FILE
done
