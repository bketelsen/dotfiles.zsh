if [ "$BJK_LINUX" = "true" ]; then
    alias onedrive-status="docker ps -f name=onedrive"
    alias onedrive-logs="docker logs onedrive"
    alias onedrive-stop="docker stop onedrive"
    alias onedrive-start="docker start onedrive"
fi
