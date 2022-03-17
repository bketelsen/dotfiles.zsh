# Expand aliases with space
typeset -U GLOBALIAS_FILTER_VALUES

zinit snippet OMZ::plugins/globalias/globalias.plugin.zsh

  export FLYCTL_INSTALL="/home/bjk/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"


