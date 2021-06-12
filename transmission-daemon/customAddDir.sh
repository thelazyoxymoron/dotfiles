#!/bin/bash

mamDir="/home/mr_robot/Collection/MAM/Ebooks/"
graphicsDir="/home/mr_robot/Collection/MAM/Graphic-Novels/"
orpheusDir="/home/mr_robot/Collection/Orpheus-Downloads/"
artDir="/home/mr_robot/Collection/Learning-Art/"
frenchDir="/home/mr_robot/Collection/Learning-Languages/French/"
cinemazDir="/home/mr_robot/Collection/CinemaZ/"

for file in /home/mr_robot/Downloads/temp/*
do
    transmission-remote --add "$file" -w $cinemazDir
    rm "$file"
done

