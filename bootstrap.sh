# boostrap all rcfiles

for filename in $(ls ~/RCs/bootstrap/); do
    . ~/RCs/bootstrap/$filename
    rc_install
done
