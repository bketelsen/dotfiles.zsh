if [ -d "/usr/local/opt/yq@3/bin" ]; then
    export PATH="/usr/local/opt/yq@3/bin:$PATH"
fi

alias k3s-uninstall="k3s-uninstall.sh"

function rc-logging {
    if [ ! $1 ]; then
        printf "Required argument(s): <command>\nExample commands: prepare patch clean charts\n"
    else
        ( cd $HOME/github.com/nickgerace/rancher-charts; PACKAGE=rancher-logging make ${1} )
    fi
}

function rc-fleet {
    if [ ! $1 ]; then
        printf "Required argument(s): <command>\nExample commands: prepare patch clean charts\n"
    else
        ( cd $HOME/github.com/nickgerace/rancher-charts; PACKAGE=fleet make ${1} )
        ( cd $HOME/github.com/nickgerace/rancher-charts; PACKAGE=fleet-crd make ${1} )
        ( cd $HOME/github.com/nickgerace/rancher-charts; PACKAGE=fleet-agent make ${1} )
    fi
}

function rc-backup {
    if [ ! $1 ]; then
        printf "Required argument(s): <command>\nExample commands: prepare patch clean charts\n"
    else
        ( cd $HOME/github.com/nickgerace/rancher-charts; PACKAGE=rancher-backup make ${1} )
        ( cd $HOME/github.com/nickgerace/rancher-charts; PACKAGE=rancher-backup-crd make ${1} )
    fi
}

