#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

killall polybar
echo "---" | tee -a /tmp/top.log /tmp/bottom.log
polybar --config=/home/ephelsa/.config/polybar/config.init top 2>&1 | tee -a /tmp/top.log & disown
polybar --config=/home/ephelsa/.config/polybar/config.init bottom 2>&1 | tee -a /tmp/bottom.log & disown

echo "Bars launched..."
