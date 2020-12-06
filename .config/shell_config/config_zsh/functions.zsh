# No arguments: `git status`
# With arguments: acts like `git`
g() {
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git status
    fi
}

ql() {
	qlmanage -p $@ &> /dev/null
}

cg() {
    if [[ $# -gt 0 ]]; then
        config "$@"
    else
        config status
    fi
}

#makedir and change into it
function mcd() {
    mkdir -p "$1" && cd "$1";
}

#enable autocd
set -o AUTO_CD

#enable autocorrect
set -o CORRECT

#git commit
function cgc(){
    config commit -m "$1"
}

function cpp(){
    if [[ $# -eq 2 ]]
    then
        gcc -lstdc++ $1 -o $2
        ./$2
    fi
    if [[ $# -eq 1 ]]
    then
        gcc -lstdc++ $1 -o ${${1}%.*}
    fi
}
