export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:/usr/local/go/bin
export PATH=${GOPATH//://bin:}/bin:$PATH

if [ "$(command -v rg)" ]; then
    alias rg-go="rg -g '*.go' -g '!zz*.go' -g '!*generated' --sort path"
fi
alias gr="go run"
alias grm="go run main.go"
alias docker-run-golangci-lint="docker run --rm -v $(pwd):/app -w /app golangci/golangci-lint:latest golangci-lint"

function go-mod-vendor {
    printf "Remove the old module first from go.mod\n"
    if [ ! $1 ] || [ ! $2 ]; then
        printf "Requires argument(s): <module-url> <git-hash>\n"
    else
        go get ${1}@${2}
        go mod vendor
    fi
}
