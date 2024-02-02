#!/usr/bin/env bash
## boostrap all rcfiles

eval RC_FILES_DIR="~/RCs/rcfiles"
export RC_FILES_DIR

eval RC_ROOT_DIR="~/RCs"
export RC_ROOT_DIR

for filename in ~/RCs/bootstrap/*; do
    . "$filename"
    rc_install
done
