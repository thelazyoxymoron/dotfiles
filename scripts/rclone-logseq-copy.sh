#!/bin/bash
if pidof -o %PPID -x "rclone-logseq-copy.sh"; then
exit 1
fi
/usr/bin/rclone copy --verbose --create-empty-src-dirs /home/mr_robot/logseq gdrive:Backup/logseq --log-file /home/mr_robot/cronlogs/logseq-copy.log
exit
