#!/bin/bash

dir="/home/mr_robot/Documents/hpi-second-brain"

python -m rexport.export --secrets $dir/reddit-secrets.py > "${dir}/exports/reddit/export-$(date -I).json"
