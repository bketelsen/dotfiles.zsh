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
        echo "required argument(s): <repo-under-bketelsen> <optional-destination-path>"
    elif [ ! $2 ]; then
        git clone git@github.com:bketelsen/${1}
    else
        git clone git@github.com:bketelsen/${1} ${2}
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
