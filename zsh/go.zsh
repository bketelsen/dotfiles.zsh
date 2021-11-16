export GOPATH=${HOME}

path=("/usr/local/go/bin" $path)
path=("${GOPATH}/bin" $path)


if [ "$(command -v rg)" ]; then
    alias rg-go="rg -g '*.go' -g '!zz*.go' -g '!*generated' --sort path"
fi
alias gr="go run"
alias grm="go run main.go"
alias docker-run-golangci-lint="docker run --rm -v $(pwd):/app -w /app golangci/golangci-lint:latest golangci-lint"

function go-mod-vendor {
    if [ ! $1 ] || [ ! $2 ]; then
        echo "required arguments: <module-url> <git-hash>"
    fi
    go get ${1}@${2}
    go mod vendor
}
