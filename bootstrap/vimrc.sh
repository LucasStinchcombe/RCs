#!/bin/bash

rc_install()
{
    # symlink vimrc
    echo -n "Symlinking vimrc: "
    if [ -f ~/.vimrc ]; then
        echo "Skip"
    else
        ln -s "$RC_FILES_DIR/vimrc" ~/.vimrc
        echo "Done"
    fi

    # Install Vundle
    if [ -d ~/.vim/bundle/Vundle.vim ]; then
        echo "Vundle already installed."
    else
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    # Install plugins
    echo -n "Installing Vundle vim plugins: "
    vim +PluginInstall +qall
    echo "Done"

}
