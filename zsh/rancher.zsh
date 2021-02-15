if [ -d "/usr/local/opt/yq@3/bin" ]; then
    export PATH="/usr/local/opt/yq@3/bin:$PATH"
fi

alias k3s-start="curl -sfL https://get.k3s.io | sudo sh -"
alias k3s-stop="k3s-uninstall.sh"

function rc-logging {
    if [ ! $1 ]; then
        printf "Required argument(s): <command>\nExample commands: prepare patch clean charts\n"
    else
        ( cd $HOME/rancher-charts; PACKAGE=rancher-logging make ${1} )
    fi
}

function rc-fleet {
    if [ ! $1 ]; then
        printf "Required argument(s): <command>\nExample commands: prepare patch clean charts\n"
    else
        ( cd $HOME/rancher-charts; PACKAGE=fleet make ${1} )
        ( cd $HOME/rancher-charts; PACKAGE=fleet-crd make ${1} )
        ( cd $HOME/rancher-charts; PACKAGE=fleet-agent make ${1} )
    fi
}

