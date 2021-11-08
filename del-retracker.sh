#!/bin/bash
# search and delete retrecker.local (home, etc)

# put your connection here
host='localhost:9091'
cred='user:pass'

for torrent_number in $(transmission-remote $host -n $cred -l | sed '1d;$d' | grep -v '*' | awk '{print $1}')
do
        tracker_list=$(transmission-remote $host -n $cred -t $torrent_number -it | grep 'retracker' | awk '{print $2+0}' | sort -r)
        for tracker_id in $tracker_list
        do
			echo $torrent_number = $tracker_id
			transmission-remote $host -n $cred -t $torrent_number -tr $tracker_id
        done
done
echo 'DONE!'
