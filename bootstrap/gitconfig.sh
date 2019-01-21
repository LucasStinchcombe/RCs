# bootstrap gitconfig

rc_install()
{
    echo -n "Updating gitconfig: "
    grep "\[include\]" ~/.gitconfig > /dev/null
    if [ $? -eq 0 ]; then
        echo "Skip"
    else
        printf "[include]\n\tpath = $RC_FILES_DIR/gitconfig\n" >> ~/.gitconfig
        echo "Done"
    fi
}
