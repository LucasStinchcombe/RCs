# Bashrc that keeps me from ending it all.

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

alias gco='git checkout'
set -o vi      # vi style command line mode

# Chill Colours
BROWN='\e[38;5;138m'
Green='\e[0;32m'
Purple='\e[0;35m'
BGreen='\e[1;32m'
NC="\e[m"               # Color Reset

# PS1 prompt
MY_PS1='\[${NC}\][\[${BROWN}\]\h '
MY_PS1+='\[${Green}\]\t '
MY_PS1+='\[${Purple}\]\w\[${NC}\]]'
MY_PS1+='\[${BGreen}\]$(parse_git_branch)\[${NC}\]'
MY_PS1+='\$ \[${NC}\]'
PROMPT_COMMAND='PS1="'$MY_PS1'";'

# LS color directories
export LS_COLORS=$LS_COLORS:'di=1;32:'
alias ls='ls --color=auto'

# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# History sizes, unbounded for in-memory and file
export HISTSIZE=-1
export HISTFILESIZE=-1

alias ssh="ssh -v"
alias scp="scp -v"

random_artwork()
{
    local ASSETS=~/RCs/assets

    # random file in $ASSETS directory
    local RAND=$(shuf -i 1-"$(ls $ASSETS | wc -l)" -n 1)
    local FILE=$(ls $ASSETS | head -n $RAND | tail -1)
    cat "${ASSETS}/${FILE}"
}

random_artwork
