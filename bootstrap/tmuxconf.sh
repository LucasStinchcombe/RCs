#!/bin/bash

rc_install()
{
    # symlink vimrc
    echo -n "Symlinking tmux.conf: "
    if [ -f ~/.tmux.conf ]; then
        echo "Skip"
    else
        ln -s "$RC_FILES_DIR/tmux.conf" ~/.tmux.conf
        echo "Done"
    fi
}
