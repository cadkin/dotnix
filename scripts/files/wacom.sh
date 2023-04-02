#!/bin/bash

# Get the devices.
ids=$(xsetwacom --list devices | awk -F' ' '{ print $(NF - 2) }')
pad=$(xsetwacom --list devices | grep PAD | awk -F' ' '{ print $(NF - 2) }')
tch=$(xsetwacom --list devices | grep TOUCH | awk -F' ' '{ print $(NF - 2) }')

# Buttons for the tablet.
declare -A btnmap
btnmap[1]="key return"
btnmap[2]="key ctrl s"
btnmap[3]="button +3"
btnmap[8]="button +1"
btnmap[9]="key shift"
btnmap[10]="key ctrl c"
btnmap[11]="key ctrl z"
btnmap[12]="key shift ctrl z"
btnmap[13]="key ctrl v"

# Touch pad acceleration (larger is slower).
tch_accel=2

# Display to map to.
head=HEAD-1

# Set everything.
for i in $ids; do
    xsetwacom --set "$i" MapToOutput $head
done

for i in "${!btnmap[@]}"; do
    xsetwacom --set "$pad" button "$i" "${btnmap[$i]}"
done

xsetwacom --set "$tch" Area 0 0 $((4096 * tch_accel)) $((4096 * tch_accel))
