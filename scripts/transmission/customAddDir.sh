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
blutopiaDir="/run/media/mr_robot/7FD0807223B36019/Golu/Movies/Blutopia/"
localMoviesDir="/home/mr_robot/Collection/Movies-High-Quality/"
secretCinemaDir="/home/mr_robot/Collection/Cinema/"
avistazDir="/home/mr_robot/Collection/To-Delete/AvistaZ"
exoticazDir="/home/mr_robot/Collection/To-Delete/ExoticaZ"

for file in /home/mr_robot/Downloads/temp/*
do
    transmission-remote --add "$file" -w $mamDir
    #transmission-remote --add "$file" -w $avistazDir
    #transmission-remote --add "$file" -w $exoticazDir
    #transmission-remote --add "$file" -w $graphicsDir
    #transmission-remote --add "$file" -w $artDir
    #transmission-remote --add "$file" -w $orpheusMp3Dir
    #transmission-remote --add "$file" -w $pterclubDir
    #transmission-remote --add "$file" -w $blutopiaDir
    #transmission-remote --add "$file" -w $orpheusDir
    #transmission-remote --add "$file" -w $localMoviesDir
    rm "$file"
done

