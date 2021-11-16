#!/usr/bin/env bash

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

mkdir -p ~/.config/lvim/
ln -s "$BJK_DOTFILES"/scripts/lvim/config.lua ~/.config/lvim/config.lua
ln -s "$BJK_DOTFILES"/scripts/lvim/ignore ~/.config/lvim/ignore

mkdir -p ~/.config/lvim/plugin/
ln -s "$BJK_DOTFILES"/scripts/lvim/packer_compiled.lua ~/.config/lvim/plugin/packer_compiled.lua
