alias d="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dimg="docker images"

alias docker-run-debian="docker run -it --rm debian:stable-slim"
alias docker-run-ubuntu="docker run -it --rm ubuntu:rolling"
alias docker-run-tumbleweed="docker run -it --rm opensuse/tumbleweed:latest"


function docker-prune-containers {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
    docker volume prune -f
}

function docker-prune-everything {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
    docker rmi $(docker images -q)
    docker system prune -a -f
    docker volume prune -f
}
