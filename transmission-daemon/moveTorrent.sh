#!/bin/bash

torrentID=${torrentID:-$1}
directory=${directory:-$2}

transmission-remote -t "$torrentID" --move "$directory"
