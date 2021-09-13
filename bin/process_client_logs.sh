#!/usr/bin/bash

cd "$1"/var/log || exit


cat ./* | awk 'match($0, /([A-Z]\w+ [0-9]+) ([0-9]+):[0-9]+:[0-9]+ [A-Za-z]\w+ sshd\[[0-9]+\]: Failed password .* ([a-zA-Z]\w*) from ([0-9]+.+) port [0-9]+ ssh2/, arr) {print arr[1] " " arr[2] " " arr[3] " " arr[4]}' > failed_login_data.txt


mv failed_login_data.txt ../../
