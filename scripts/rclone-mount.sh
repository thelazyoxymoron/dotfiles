#!/bin/bash
if pidof -o %PPID -x "rclone-mount.sh"; then
exit 1
fi
/usr/bin/rclone mount gdrive:Books /home/mr_robot/GoogleDriveBooks/ --vfs-cache-mode writes --daemon --verbose --log-file /home/mr_robot/cronlogs/drivebooks-mount.log

/usr/bin/rclone mount gdrive:Backup/logseq /home/mr_robot/logseq-gdrive-backup/ --vfs-cache-mode writes --daemon --verbose --log-file /home/mr_robot/cronlogs/logseq-mount.log

/usr/bin/rclone mount gdrive:Backup/SingleFileZ-Save-Everything /home/mr_robot/Collection/SingleFileZ-Save-Everything/ --vfs-cache-mode writes --daemon --verbose --log-file /home/mr_robot/cronlogs/logseq-mount.log
exit
