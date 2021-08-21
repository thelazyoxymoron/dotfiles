#!/bin/bash

entries=$(cat /home/mr_robot/Music/scripts/somafm-ambient.txt | shuf | awk '{print $2}')

track=$(echo $entries | awk '{print $1}')

mpv --no-video $track

