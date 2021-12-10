export BJK_DOTFILES=$HOME/src/github.com/bketelsen/dotfiles.zsh
export BJK_ARCH="$(uname -m)"

# Set the OS and WSL2 variables for usage in other scripts.
if [ "$(uname -s)" = "Darwin" ]; then
    export BJK_OS="darwin"
    export BJK_LINUX="false"
elif [ -f /etc/os-release ]; then
    OS_RELEASE_ID=$(grep '^ID=' /etc/os-release | sed 's/^ID=//' | tr -d '"')
    if [ "$OS_RELEASE_ID" = "ubuntu" ] || [ "$OS_RELEASE_ID" = "pop" ] || [ "$OS_RELEASE_ID" = "fedora" ] || [ "$OS_RELEASE_ID" = "opensuse-tumbleweed" ]; then
        export BJK_OS="$OS_RELEASE_ID"
        export BJK_LINUX="true"
    else
        export BJK_OS="unknown"
        export BJK_LINUX="unknown"
    fi

    if [ "$OS_RELEASE_ID" = "ubuntu" ] || [ "$OS_RELEASE_ID" = "pop" ] ; then
        export BJK_DEB="true"
    else
        export BJK_DEB="false"
    fi

    if [ -f /proc/sys/kernel/osrelease ] && [ $(grep "WSL2" /proc/sys/kernel/osrelease) ]; then
        export BJK_WSL2="true"
    else
        export BJK_WSL2="false"
    fi
else
    export BJK_OS="unknown"
    export BJK_LINUX="unknown"
fi

for file in $BJK_DOTFILES/zsh/paths/*; do
    source "$file"
done
for file in $BJK_DOTFILES/zsh/aliases/*; do
    source "$file"
done
for file in $BJK_DOTFILES/zsh/functions/*; do
    source "$file"
done
