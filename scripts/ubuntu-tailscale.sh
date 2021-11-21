#!/bin/bash

curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/hirsute.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/hirsute.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update
sudo apt-get install tailscale

sudo tailscale up
