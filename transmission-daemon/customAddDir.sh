#!/bin/bash

mamDir="/home/mr_robot/Collection/MAM/Ebooks/"
graphicsDir="/home/mr_robot/Collection/MAM/Graphic-Novels/"
orpheusDir="/home/mr_robot/Collection/Orpheus-Downloads/"
orpheusMp3Dir="/home/mr_robot/Collection/Orpheus-Downloads/mp3/"
artDir="/home/mr_robot/Collection/Learning-Art/"
frenchDir="/home/mr_robot/Collection/Learning-Languages/French/"
cinemazDir="/home/mr_robot/Collection/CinemaZ/"
bithdtvDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/Bit-HDTV"
moviesDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/"
pterclubDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/PTerclub/"

for file in /home/mr_robot/Downloads/temp/*
do
    #transmission-remote --add "$file" -w $mamDir
    #transmission-remote --add "$file" -w $graphicsDir
    #transmission-remote --add "$file" -w $artDir
    transmission-remote --add "$file" -w $orpheusMp3Dir
    #transmission-remote --add "$file" -w $pterclubDir
    rm "$file"
done

