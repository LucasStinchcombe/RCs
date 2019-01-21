# bootstrap bashrc

rc_install()
{
    echo -n "Updating bashrc: "
    grep $RC_FILES_DIR/bashrc ~/.bashrc > /dev/null
    if [ $? -eq 0 ]; then
        echo "Skip"
    else
        printf "\n. $RC_FILES_DIR/bashrc\n" >> ~/.bashrc
        echo "Done"
    fi
}
