if [ "$BJK_LINUX" = "true" ]; then
    if [ "$BJK_WSL2" != "true" ]; then
        alias bye="sudo shutdown now"
        alias check-power="powerstat -R -c -z"
        alias check-firmware="fwupdmgr get-devices"
        alias update-firmware="fwupdmgr update"
    fi
    alias check-os="cat /etc/os-release"
    alias get-public-ip-address="dig +short myip.opendns.com @resolver1.opendns.com"
fi
