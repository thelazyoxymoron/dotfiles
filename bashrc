#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Enables floating point division
alias bc='bc -l'

# Ambient music aliases
alias headphone='/bin/bash /home/mr_robot/Music/scripts/headphone-commute-playlist.sh'
alias videogame='/bin/bash /home/mr_robot/Music/scripts/video-game-ambient.sh'
alias lofi='/bin/bash /home/mr_robot/Music/scripts/mpv-lofi-radio.sh'
alias programming='/bin/bash /home/mr_robot/Music/scripts/music-for-programming.sh'
alias somafm='/bin/bash /home/mr_robot/Music/scripts/somafm.sh'
alias music='echo headphone, videogame, lofi, programming, somafm'

PS1='[\u@\h \W]\$ '

export MOZ_ENABLE_WAYLAND=1

# Testing this to make programs aware
# of what's the wm that we're using
# UPDATE: Adding this flag in sway's config
# See: https://github.com/emersion/xdg-desktop-portal-wlr

export XDG_CURRENT_DESKTOP=sway

# Adding the following path for any packages
# installed from pip in --user mode
export PATH=/home/mr_robot/.local/bin:$PATH

# Adding for flutter/dart development
export PATH=/home/mr_robot/Projects/flutter/bin:$PATH

# To support kitty's icat (terminal image viewer using ImageMagick)
alias icat="kitty +kitten icat"

# To support fzf completions in shell
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
