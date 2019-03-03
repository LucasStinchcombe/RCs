#!/bin/bash

rc_install()
{
    # symlink vimrc
    echo -n "Symlinking neovim init.vim: "
    if [ -f ~/.config/nvim/init.vim ]; then
        echo "Skip"
    else
        mkdir -p ~/.config/nvim
        ln -s "RC_FILES_DIR/nvimrc" ~/.config/nvim/init.vim
        echo "Done"
    fi

    # Install Vundle
    if [ -d ~/.vim/bundle/Vundle.vim ]; then
        echo "Vundle already installed."
    else
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    # Install plugins
    echo -n "Installing Vundle neovim plugins: "
    nvim +PluginInstall +qall
    echo "Done"

}
