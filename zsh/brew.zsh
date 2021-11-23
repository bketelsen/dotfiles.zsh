if [ "$BJK_OS" = "darwin" ]; then
    if [ -d /opt/homebrew/bin ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    if [ -d /opt/homebrew/opt/ruby/bin ]; then
        export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    fi
fi
alias b='brew'
alias bb='brew bundle --no-upgrade'
alias bbg='brew bundle --no-upgrade --global'