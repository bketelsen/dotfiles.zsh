function update {
    if [ "$BJK_OS" = "ubuntu" ]; then
        if [ "$(command -v apt)" ]; then
            sudo apt update
            sudo apt upgrade -y
            sudo apt autoremove -y
        fi
        if [ "$(command -v snap)" ] && [ "$BJK_WSL2" != "true" ]; then
            sudo snap refresh
        fi
    elif [ "$BJK_OS" = "fedora" ] && [ "$(command -v dnf)" ]; then
        sudo dnf upgrade --refresh
        sudo dnf autoremove
    elif [ "$BJK_OS" = "opensuse-tumbleweed" ] && [ "$(command -v zypper)" ]; then
        sudo zypper update -y
    elif [ "$BJK_OS" = "darwin" ] && [ "$(command -v brew)" ]; then
        brew update
        brew upgrade
        brew cleanup
        brew bundle dump --force --file $BJK_DOTFILES/darwin/brewfile-$BJK_ARCH.rb
    fi

    if [ "$(command -v rustup)" ]; then
        rustup update
    fi

    if [ "$(command -v cargo)" ]; then
        if [ ! -f $HOME/.cargo/bin/cargo-install-update ]; then
            cargo install cargo-update
        fi
        cargo install-update -a
        cargo install --list | grep -o "^\S*\S" | jq -Rn '[inputs]' > $BJK_DOTFILES/crates.json
    fi
}
