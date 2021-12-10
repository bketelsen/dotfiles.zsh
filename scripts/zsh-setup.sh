#!/usr/bin/env bash

source ./scripts/variables.sh
ZSH=$(command -v zsh)
echo "${ZSH}" | sudo tee -a /etc/shells
chsh -s "${ZSH}"
