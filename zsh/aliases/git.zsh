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
alias code='code-insiders'