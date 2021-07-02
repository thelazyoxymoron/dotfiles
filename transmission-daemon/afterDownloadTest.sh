#!/bin/bash

audiobooksDir="/home/mr_robot/Collection/MAM/Audiobooks/"
graphicsDir="/home/mr_robot/Collection/MAM/Graphic-Novels/"
ebooksDir="/home/mr_robot/Collection/MAM/Ebooks/"
orpheusDir="/home/mr_robot/Collection/Orpheus-Downloads/"
libbleDownloads="/home/mr_robot/Collection/Libble-Downloads/"

tracker="$(transmission-remote -t $TR_TORRENT_ID -i | grep Magnet )"

if [[ "$tracker" == *"myanonamouse.net"* ]]; then
    fileType="$(transmission-remote -t $TR_TORRENT_ID -f)"
    if [[ ("$fileType" == *"mp3"*) || ("$fileType" == *"m4b"*) ]]; then
        transmission-remote -t $TR_TORRENT_ID --labels [mam,audiobooks]
        transmission-remote -t $TR_TORRENT_ID --move $audiobooksDir
    elif [[ ("$fileType" == *"cbr"*) || ("$fileType" == *"cbz"*) ]]; then
        transmission-remote -t $TR_TORRENT_ID --labels [mam,graphic-novels]
        transmission-remote -t $TR_TORRENT_ID --move $graphicsDir
    else
        echo "Moved cbr/cbz/mp3/m4b files. Rest should be ebooks!"
        transmission-remote -t $TR_TORRENT_ID --labels [mam,ebooks]
        transmission-remote -t $TR_TORRENT_ID --move $ebooksDir
    fi

elif [[ "$tracker" == *"orpheus"* ]]; then
    transmission-remote -t $TR_TORRENT_ID --labels [orpheus,trash]
    transmission-remote -t $TR_TORRENT_ID --move $orpheusDir
elif [[ "$tracker" == *"libble"* ]]; then
    transmission-remote -t $TR_TORRENT_ID --labels [libble]
    transmission-remote -t $TR_TORRENT_ID --move $libbleDownloads
fi

