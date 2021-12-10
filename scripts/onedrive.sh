#!/bin/bash

# Update ONEDRIVE_DATA_DIR with correct existing OneDrive directory path
ONEDRIVE_DATA_DIR="${HOME}/OneDrive"
mkdir -p ONEDRIVE_DATA_DIR

firstRun='-d'
docker pull driveone/onedrive:latest
docker inspect onedrive_conf > /dev/null || { docker volume create onedrive_conf; firstRun='-it'; }
docker inspect onedrive > /dev/null && docker rm -f onedrive
docker run $firstRun --restart unless-stopped --name onedrive -v onedrive_conf:/onedrive/conf -v "${ONEDRIVE_DATA_DIR}:/onedrive/data" driveone/onedrive:latest