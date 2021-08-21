#!/bin/bash

torrentID=${torrentID:-$1}
label1=${label1:-$2}
label2=${label2:-$3}

transmission-remote -t $torrentID --labels [$label1,$label2]
