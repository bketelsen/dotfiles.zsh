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
