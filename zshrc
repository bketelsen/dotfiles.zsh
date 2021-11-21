source "${HOME}/.zprofile"

# Add autocomplete functionality before everything else.
# Solution: https://github.com/kubernetes/kubectl/issues/125#issuecomment-351653836
export HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi



source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# If facing issues on macOS, run the following command...
# compaudit | xargs chmod g-w

# These environment variables are used in other ZSH configuration files.
export BJK_DOTFILES=$HOME/src/github.com/bketelsen/dotfiles.zsh
export BJK_ARCH="$(uname -m)"

# Set the OS and WSL2 variables for usage in other scripts.
if [ "$(uname -s)" = "Darwin" ]; then
    export BJK_OS="darwin"
    export BJK_LINUX="false"
elif [ -f /etc/os-release ]; then
    OS_RELEASE_ID=$(grep '^ID=' /etc/os-release | sed 's/^ID=//' | tr -d '"')
    if [ "$OS_RELEASE_ID" = "ubuntu" ] || [ "$OS_RELEASE_ID" = "fedora" ] || [ "$OS_RELEASE_ID" = "opensuse-tumbleweed" ]; then
        export BJK_OS="$OS_RELEASE_ID"
        export BJK_LINUX="true"
    else
        export BJK_OS="unknown"
        export BJK_LINUX="unknown"
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
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

##
# Paths
#
# In zsh, the $PATH variable is tied to the $path variable.
# This makes the $path variable act like a set.
typeset -U path

for file in $BJK_DOTFILES/zsh/*; do
    source "$file"
done
