# bootstrap bashrc

rc_install()
{
    echo -n "Symlinking inputrc: "
    if [ -f ~/.inputrc ]; then
        echo "Skip"
    else
        ln -s $RC_FILES_DIR/inputrc ~/.inputrc
        echo "Done"
    fi
}
