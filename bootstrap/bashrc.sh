# bootstrap bashrc

rc_install()
{
    echo -n "Updating bashrc: "
    grep "~/RCs/bashrc" ~/.bashrc > /dev/null
    if [ $? -eq 0 ]; then
        echo "Skip"
    else
        printf "\n. ~/RCs/bashrc\n" >> ~/.bashrc
        echo "Done"
    fi
}
