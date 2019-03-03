#!/bin/bash

rc_install()
{
    echo -n "Updating gitconfig: "

    if grep '\[include\]' ~/.gitconfig > /dev/null;
    then
        echo "Skip"
    else
        printf '[include]\n\tpath = %s/gitconfig\n' "$RC_FILES_DIR" >> ~/.gitconfig
        echo "Done"
    fi
}
