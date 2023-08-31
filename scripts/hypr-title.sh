#!/usr/bin/bash

read_interval=0.2s

# This script will listen the change of hyprland active window
if [[ $(command -v jq) ]]; then
    prev_result=""
    while [[ true ]]; do
        result=$(hyprctl activewindow -j | jq ".title" | sed 's/^"\(.*\)"$/\1/')
        if [ "$result" != "$prev_result" ]; then
            echo "$result"
            prev_result="$result"
        fi
        sleep $read_interval 
    done
fi
