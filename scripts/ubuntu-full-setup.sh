#!/usr/bin/bash
if [ "$USER" = "root" ]; then
    echo "must not run as root (nor with sudo)"
    exit 1
fi

sudo apt update
sudo apt install -y lsb-release

REAL_USER=$USER
RELEASE=$(lsb_release -cs)
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    ARCH=amd64
fi
IS_WSL2="false"
if [ -f /proc/sys/kernel/osrelease ] && [ $(grep "WSL2" /proc/sys/kernel/osrelease) ]; then
    IS_WSL2="true"
fi

SLEEP_SECONDS=10
echo "=========================="
echo "user: $REAL_USER"
echo "release: $RELEASE ($(lsb_release -rs))"
echo "architecture: $ARCH"
echo "WSL2: $IS_WSL2"
echo "continuing in $SLEEP_SECONDS seconds..."
echo "=========================="
sleep $SLEEP_SECONDS

function pre-install {
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y \
        build-essential \
        cloc \
        curl \
        wget \
        git \
        make \
        autoconf \
        tmux \
        byobu \
        htop \
        gcc \
        git \
        pkg-config \
        stow \
        zsh \
        zsh-autosuggestions \
        zsh-syntax-highlighting \
        libssl-dev

    if [ "$IS_WSL2" != "true" ]; then
        sudo apt install -y \
            virtualbox \
            linux-headers-oem \
            virtualbox-dkms \
            ubuntu-restricted-extras
    fi
}


function install-docker {
    sudo apt remove -y docker docker-engine docker.io containerd runc
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$ARCH signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $RELEASE stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker $REAL_USER
    if [ "$IS_WSL2" != "true" ]; then
        sudo systemctl enable docker
    fi
}


function install-tailscale {
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add -
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list
    sudo apt-get update
    sudo apt-get install tailscale
    sudo tailscale up
}


function post-install {
    sudo apt autoremove -y
    if [ "$IS_WSL2" != "true" ]; then
        echo "(optional) configure GNOME terminal: https://github.com/Mayccoll/Gogh"
    fi
}

#font_url='https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'; font_name=${font_url##*/}; wget ${font_url} && unzip ${font_name} -d ~/.fonts && fc-cache -fv ;

pre-install
install-docker
install-tailscale
post-install

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

