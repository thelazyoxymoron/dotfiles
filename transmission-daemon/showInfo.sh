#!/bin/bash

torrentID=${torrentID:-$1}

transmission-remote -t $torrentID -i
