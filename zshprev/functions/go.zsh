function go-mod-vendor {
    if [ ! $1 ] || [ ! $2 ]; then
        echo "required arguments: <module-url> <git-hash>"
    fi
    go get ${1}@${2}
    go mod vendor
}
