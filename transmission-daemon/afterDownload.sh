#!/bin/bash

torrentsIdle=($(transmission-remote --list | grep Idle | awk '{print $1}'))

mamTracker="t.myanonamouse.net"
bitspyderTracker="bitspyder.net"

graphicsDir="/home/mr_robot/Collection/MAM/Graphic-Novels/"
ebooksDir="/home/mr_robot/Collection/MAM/Ebooks/"
audiobooksDir="/home/mr_robot/Collection/MAM/Audiobooks/"
frenchDir="/home/mr_robot/Collection/Learning-Languages/French/"
guitarDir="/home/mr_robot/Collection/Learning-Music/"
bitspyderDir="/home/mr_robot/Collection/BitSpyder/"
filelistDir="/home/mr_robot/Collection/To-Delete/Filelist/"
asianCinemaDir="/home/mr_robot/Collection/To-Delete/AsianCinema/"
torrentleechDir="/home/mr_robot/Collection/To-Delete/Torrentleech/"
beyondhdDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/Beyond-HD/"
blutopiaDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/Blutopia/"
brokenStonesDir="/home/mr_robot/Collection/BrokenStones/"
cinemazDir="/home/mr_robot/Collection/CinemaZ/"
exoticazDir="/home/mr_robot/Collection/To-Delete/ExoticaZ/"
lztrDir="/home/mr_robot/Collection/LzTr-Downloads/"
orpheusDir="/home/mr_robot/Collection/Orpheus-Downloads/"
pterclubDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/PTerclub/"
secretCinemaDir="/home/mr_robot/Collection/Secret-Cinema/"
generalDir="/home/mr_robot/Collection/General-Downloads/"


for i in "${torrentsIdle[@]}"; do
    tracker="$(transmission-remote -t $i -i | grep Magnet )"
    labels="$(transmission-remote -t $i -i | grep Labels )"

    if [[ "$tracker" == *"$mamTracker"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            fileType="$(transmission-remote -t $i -f)"
            if [[ ("$fileType" == *"mp3"*) || ("$fileType" == *"m4b"*) ]]; then
                transmission-remote -t $i --labels [mam,audiobooks]
                transmission-remote -t $i --move $audiobooksDir
            elif [[ ("$fileType" == *"cbr"*) || ("$fileType" == *"cbz"*) ]]; then
                transmission-remote -t $i --labels [mam,graphic-novels]
                transmission-remote -t $i --move $graphicsDir
            else
                echo "Moved cbr/cbz/mp3/m4b files. Rest should be ebooks!"
                transmission-remote -t $i --move $ebooksDir
            fi


        elif [[ "$labels" == *"graphic-novels"* ]]; then
            transmission-remote -t $i --move $graphicsDir
        elif [[ "$labels" == *"french"* ]]; then
            transmission-remote -t $i --move $frenchDir
        elif [[ "$labels" == *"guitar"* ]]; then
            transmission-remote -t $i --move $guitarDir
        elif [[ "$labels" == *"audiobooks"* ]]; then
            transmission-remote -t $i --move $audiobooksDir

        else
            echo "Nothing else to do for MAM torrents!"
        fi

    elif [[ "$tracker" == *"bitspyder"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [bitspyder]
            transmission-remote -t $i --move $bitspyderDir
        fi

    elif [[ "$tracker" == *"filelist"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [filelist]
            transmission-remote -t $i --move $filelistDir
        fi

    elif [[ "$tracker" == *"asiancinema"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [asiancinema]
            transmission-remote -t $i --move $asianCinemaDir
        fi

    elif [[ "$tracker" == *"torrentleech"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [torrentleech]
            transmission-remote -t $i --move $torrentleechDir
        fi

    elif [[ "$tracker" == *"beyond-hd"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [beyondhd]
            transmission-remote -t $i --move $beyondhdDir
        fi

    elif [[ "$tracker" == *"blutopia"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [blutopia]
            transmission-remote -t $i --move $blutopiaDir
        fi

    elif [[ "$tracker" == *"brokenstones"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [brokenstones]
            transmission-remote -t $i --move $brokenStonesDir
        fi

    elif [[ "$tracker" == *"cinemaz"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [cinemaz]
            transmission-remote -t $i --move $cinemazDir
        fi

    elif [[ "$tracker" == *"exoticaz"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [exoticaz]
            transmission-remote -t $i --move $exoticazDir
        fi

    elif [[ "$tracker" == *"lztr"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [lztr]
            transmission-remote -t $i --move $lztrDir
        fi

    elif [[ "$tracker" == *"orpheus"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [orpheus]
            transmission-remote -t $i --move $orpheusDir
        fi

    elif [[ "$tracker" == *"pterclub"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [pterclub]
            transmission-remote -t $i --move $pterclubDir
        fi

    elif [[ "$tracker" == *"secret-cinema"* ]]; then
        if [[ "$labels" != *'['* ]]; then
            transmission-remote -t $i --labels [secret-cinema]
            transmission-remote -t $i --move $secretCinemaDir
        fi
    else
        echo "No other private trackers found, keep it in general download area"
        transmission-remote -t $i --labels [general]
        transmission-remote -t $i --move $generalDir
    fi
done
