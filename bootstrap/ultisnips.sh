#!/bin/bash

rc_install()
{
    echo -n "Adding ultisnips: "

    # Check if ~/.vim/Ultisnips exists
    if [ -d "$HOME/.vim/UltiSnips" ]
    then
        echo "Skip"
    else
        ln -s "$RC_ROOT_DIR/UltiSnips" "$HOME/.vim/UltiSnips"
        echo "Done"
    fi
}
