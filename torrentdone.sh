#!/bin/bash

tracker_list=$(transmission-remote -n $USER:$PASS -t $TR_TORRENT_ID -it | grep 'retracker' | awk '{print $2+0}' | sort -r)
for tracker_id in $tracker_list
do
        transmission-remote -n $USER:$PASS -t $TR_TORRENT_ID -tr $tracker_id
done
