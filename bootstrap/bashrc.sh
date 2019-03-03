#!/bin/bash

rc_install()
{
    echo -n "Updating bashrc: "

    # Check if repository bashrc is sourced from system bashrc
    if grep "$RC_FILES_DIR/bashrc" ~/.bashrc > /dev/null
    then
        echo "Skip"
    else
        printf '\n# Source bashrc from RCs repo\n' >> ~/.bashrc
        echo ". $RC_FILES_DIR/bashrc" >> ~/.bashrc
        echo "Done"
    fi
}
