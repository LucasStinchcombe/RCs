# boostrap all rcfiles

eval RC_FILES_DIR="~/RCs/rcfiles/"
export RC_FILES_DIR

for filename in $(ls ~/RCs/bootstrap/); do
    . ~/RCs/bootstrap/$filename
    rc_install
done
