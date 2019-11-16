# pecoの設定
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        awk '!a[$0]++' | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    #zle clear-screen
}
zle -N peco-select-history

function peco-directory-serch() {
    #while :
    i=0
    while [ $i -lt 10 ]
    do
        cd "$( ls -1d */ | peco )" && ls -1a | peco
        #echo "continue? (enter or n)"
        read -s -k key
        if [ $key = "\cc" ]; then
            break
        fi
    done
}
zle -N peco-directory-serch
