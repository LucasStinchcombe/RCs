# Bashrc that keeps me from ending it all.

export TOP_MSG="
    \"TO UNDERSTAND RECURSION ONE MUST FIRST UNDERSTAND RECURSION.\"

                           .,,uod8B8bou,,.
                  ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
             ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
             !...:!TVBBBRPFT||||||||||!!^^\"\"\'   ||||
             !.......:!?|||||!!^^\"\"\'            ||||
             !.........||||                     ||||
             !.........||||                     ||||
             !.........||||                     ||||
             !.........||||                     ||||
             !.........||||                     ||||
             !.........||||                     ||||
             \`.........||||                    ,||||
              .;.......||||               _.-!!|||||
       .,uodWBBBBb.....||||       _.-!!|||||||||!:\'
    !YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb....
    !..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   \`.
    !....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     \`.
    !......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^\"\`;:::       \`.
    !........YBBBBBBBBBBRPFT?!::::::::::^\'\'...::::::;         iBBbo.
    \`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
      \`..........:::::::::::::::::::::::;iof688888888888b.     \`YBBBP^\'
        \`........::::::::::::::::;iof688888888888888888888b.     \`
          \`......:::::::::;iof688888888888888888888888888888b.
            \`....:::;iof688888888888888888888888888888888899fT!
              \`..::!8888888888888888888888888888888899fT|!^\"\'
                \`\' !!988888888888888888888888899fT|!^\"\'
                    \`!!8888888888888888899fT|!^\"\'
                      \`!988888888899fT|!^\"\'
                        \`!9899fT|!^\"\'
                          \`!^\"\'
        
"

printf "$TOP_MSG"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export STORAGE_FILE=".env_storage.txt"

store() {
    touch $STORAGE_FILE
    if [ $1 == "var" ]; then
        echo "var|$2|${!2}\n" >> $STORAGE_FILE
    fi

    if [ $1 == "alias" ]; then
        echo "alias|$2|$(alias $2 | cut -d '=' -f 2-)" >> $STORAGE_FILE
    fi
}

set -o vi      # vi style command line mode
