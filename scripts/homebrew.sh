#!/bin/bash

# run from root of repostory

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

source ./scripts/variables.sh

if [ "$BJK_OS" = "unknown" ]; then
	echo "Unable to determine OS. Exiting."
	exit 1
fi

if [[ -a /opt/homebrew/bin ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -a /home/linuxbrew/.linuxbrew/bin ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew install zsh gcc git bash make jq neovim vim curl wget
