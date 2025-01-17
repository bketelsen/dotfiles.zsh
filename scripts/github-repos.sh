#!/usr/bin/env bash
REPOS=$(curl -s "https://api.github.com/users/bketelsen/repos?per_page=$(curl -s https://api.github.com/users/bketelsen | jq -r '.public_repos')")
echo "[ACTIVE]"
echo $REPOS | jq -r '.[] | select(.fork != true) | select(.archived != true) | .name'
echo ""
echo "[ARCHIVED]"
echo $REPOS | jq -r '.[] | select(.fork != true) | select(.archived == true) | .name'

