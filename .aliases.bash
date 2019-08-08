# ======================
# ====== ALIASES =======
# === nickgerace.dev ===
# ======================

# Vim
alias update-vim-plugs='vim +PlugUpdate +qall'
alias upgrade-vim-plugs='vim +PlugUpdate +PlugUpgrade +PlugClean +qall'
alias vi='vim'
alias v='vim'

# DEB
alias sai='sudo apt install'
alias sar='sudo apt remove'
alias sau='sudo apt update -y'
alias sauu='sudo apt update -y && sudo apt upgrade -y'
alias sadu='sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y'
alias saa='sudo apt autoremove -y'
alias apthistory='less /var/log/apt/history.log'

# RPM 
alias sdi='sudo dnf install -y'
alias sdr='sudo dnf remove -y'
alias sdupr='sudo dnf upgrade -y --refresh'
alias sda='sudo dnf autoremove -y'
alias sdca='sudo dnf clean all -y'
alias sds='sudo dnf search'

# macOS
alias b='brew'
alias bd='brew doctor'
alias bu='brew update'
alias bup='brew upgrade'
alias buu='brew update && brew upgrade'
alias bs='brew search'
alias bclean='brew cleanup'

# Git
alias g='git'
alias gadd='git add'
alias gcomm='git commit'
alias gcommit='git commit'
alias gdiff='git diff'
alias gfetch='git fetch'
alias gpom='git push origin master'
alias gpull='git pull'
alias gstat='git status'
alias git-store-credentials='git config credential.helper store'
alias branch='git rev-parse --abbrev-ref HEAD'

# Perforce
alias po='p4 opened'

# Dotfiles
alias vbash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias szsh='source ~/.zshrc'
alias vzsh='vim ~/.zshrc'
alias czsh='cp ~/.zshrc'
alias valiases='vim ~/.aliases.bash'
alias vvim='vim ~/.vimrc'
alias cvim='cp ~/.vimrc'

# Server
alias bye='sudo poweroff'
alias checkpower='powerstat -R -c -z'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'

# General
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias del='rm -rfi'
alias h='history'
alias name='printf '%s' "whoami: " && whoami && printf '%s' "hostname: " && hostname' 

# Docker
alias d='docker'
alias dlint='docker run --rm -i hadolint/hadolint < Dockerfile'
alias dpurge='docker system purge'
alias dpurge-all='docker system purge -a'
alias dflask='docker run -dp 5000:5000'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dfind='tree -P "Dockerfile"'
alias drun='docker run'
alias dc='docker-compose'

# Python
alias p='python3'
alias prun='python3'
alias pinstall='pip3 install'
alias fr='flask run'

# Kubernetes
alias k='kubectl'

# Disabled
# alias entermysql='sudo mysql -u root'
# alias ls='ls --color=auto'
# alias grep='grep --color=auto'