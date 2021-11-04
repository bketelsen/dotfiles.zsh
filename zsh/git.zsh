alias g="git"
alias gd="git diff"
alias gadd="git add"
alias gbc="git branch --show-current"
alias gcomm="git commit"
alias gcommit="git commit"
alias gcs="git commit -s"
alias gcomms="git commit -s"
alias gdiff="git diff"
alias gpo="git push origin"
alias gpull="git pull"
alias gpu="git pull"
alias gpuo="git pull origin"
alias gst="git status"
alias gstat="git status"
alias reset-repo-to-last-commmit="git reset --hard"
alias git-pull-fix="git config --global pull.ff only"
alias git-show-tags='git log --tags --simplify-by-decoration --pretty="format:%ci %d"'
alias gcdf="git clean -df"
alias git-clean-all-"git clean -fd"
alias gcl="git config -l"

alias gbva="git branch -v -a"
alias branch="git rev-parse --abbrev-ref HEAD"
alias branches="git branch -a"
alias git-update-branches="git remote update origin --prune"
alias branch-new="git checkout -b"
alias branch-delete="git branch -d"

alias squash='printf "git reset --soft HEAD~N\n"'
alias git-checkout-remote='printf "git checkout -b branch origin/branch\n"' 
alias git-delete-remote-tag='printf "git push --delete origin <tag>\n"'

alias git-reset-undo="git reset 'HEAD@{1}'"
alias git-history="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

function post-merge {
    if [ ! $1 ]; then
        echo "required argument: <main-branch>"
        return
    fi
    local DELETE=$(git rev-parse --abbrev-ref HEAD)
    git pull --rebase origin $1
    git checkout $1
    git pull origin $1
    git branch -d $DELETE
    git pull --prune
}

function rebase-forked-repo {
    if [ ! $1 ]; then
        echo "requires arguments: <upstream-branch> <OPTIONAL-provide-full-remote-address>"
        return
    fi
    if [ $2 ] && [ "$2" != "" ]; then
        if [ "$(git remote | grep upstream)" ]; then
            git remote remove upstream
        fi
        git remote add upstream $2
        git remote -v
    fi
    if git ls-remote upstream > /dev/null; then
        git fetch upstream
        git rebase upstream/$1
    else
        echo "could not find expected remote: upstream"
    fi
}

function git-checkout-tag {
    if [ ! $1 ]; then
        echo "argument required: <tag>"
        return
    fi
    git fetch --all --tags
    local DOES_EXIST=$(git branch --list $1)
    if [[ -z ${DOES_EXIST} ]]; then
        git checkout tags/$1 -b $1
    else
        echo "branch already exists"
    fi
}

function git-diff-check-permissions {
    ls -l $(git diff --name-only)
}

function github-clone {
    if [ ! $1 ]; then
        echo "required argument(s): <repo-under-nickgerace> <optional-destination-path>"
    elif [ ! $2 ]; then
        git clone git@github.com:nickgerace/${1}
    else
        git clone git@github.com:nickgerace/${1} ${2}
    fi
}

function github-branch-comparison {
    if [ ! $1 ] || [ ! $2 ] || [ ! $3 ]; then
        echo "required arguments: <owner/repo> <older-branch> <newer-branch>"
        echo "note: to specifcy a fork, use 'fork:branch' rather than just 'branch"
        return
    fi
    echo "https://github.com/$1/compare/$2...$3"
}

function git-delete-remote-branch {
    if [ ! $1 ] || [ "$1" != "" ]; then
        echo "required argument: <branch-name>"
        return
    fi
    git push origin --delete $1
    git branch -D $1
}
