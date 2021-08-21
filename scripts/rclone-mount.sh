#!/bin/bash
if pidof -o %PPID -x "rclone-mount.sh"; then
exit 1
fi
/usr/bin/rclone mount gdrive:Books /home/mr_robot/GoogleDriveBooks/ --vfs-cache-mode writes --daemon --verbose --log-file /home/mr_robot/cronlogs/logseq-mount.log
exit
