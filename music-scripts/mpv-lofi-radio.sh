#!/usr/bin/env bash

function get_list() {
    cat $listfile
}

baseurl="https://www.youtube.com/watch?v="
listfile=${1:-~/Music/scripts/lofi.txt}
[ ! -s "$listfile" ] && echo "missing list: $listfile" && exit 1

last=1
lastplayed=""
origlist=$(get_list)
list=$origlist
while true ; do
    echo "choose from the list:"
    entries=$(echo "$list" | nl -s '|' |sed -e 's/^ *//g' | awk -F"|" -vbase=$baseurl '{
        ($4 ~ /http/) ? b="" : b=base;
        printf("%3s | %-75s (%s)\n", $1, substr($2, 1, 200), b$3);
    }')
    echo "$entries"
    [ ! -z "$lastplayed" ] && echo -e "\n   Last played: $lastplayed\n"
    count=$(echo "$entries"|wc -l |tr -d " ")

    echo -e "\nenter choice [0: reset l: reload s: shuffle r: random n: next p: replay c: clear q: quit]: \c"
    read srl
    [ "$srl" = "q" ] && exit
    [ "$srl" = "c" ] && clear
    [ "$srl" = "0" ] && list=$origlist
    [ "$srl" = "l" ] && list=$(get_list)
    [ "$srl" = "p" ] && srl=$last
    [ "$srl" = "r" ] && srl=$(echo "$entries"|awk '{print $1}'|shuf -i1-$count -n 1)
    [ "$srl" = "s" ] && list=$(echo "$list"|shuf)
    [ "$srl" = "n" ] && srl=$((last+1 > count ? count : last+1))
    match=$(echo "$entries"|awk -v srl=$srl '$1 == srl')
    [ -z "$match" ] && continue
    last=$srl

    name=$(echo "$match" | cut -d"|" -f2)
    # url=$(echo "$match" | cut -d"(" -f2 | cut -d")" -f1|tr -d " ")
    url=$(echo "$match" | awk '{print $4}')

    title="$(echo $name|tr -s " ")"
    echo "Playing $title"
    mpv --no-video $url
    lastplayed=$title
done
