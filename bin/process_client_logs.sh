#!/usr/bin/bash

#Goes into desired folder
cd "$1"/var/log || exit

#Concatenates all files together
#Matches the desired output
#Moves output into new file
cat ./* | awk 'match($0, /([A-Z]\w+)\s+([0-9]+) ([0-9]+):[0-9]+:[0-9]+ [A-Za-z]\w+ sshd\[[0-9]+\]: Failed password .* ([a-zA-Z]\w*) from ([0-9]+.+) port [0-9]+ ssh2/, arr) {print arr[1] " " arr[2] " " arr[3] " " arr[4] " " arr[5]}' > failed_login_data.txt

#Moves file to desired folder
mv failed_login_data.txt ../../
