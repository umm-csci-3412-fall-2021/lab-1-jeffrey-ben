#!/usr/bin/bash

cd "$1"/var/log || exit


cat ./* > file_to_process.txt

awk 'match($0, /([A-Z]\w+) (\d\d) (\d\d):\d\d:\d\d [A-Za-z]\w+ sshd\[\d\d\d\d\d\]: Failed password for (?:invalid user )?([a-zA-Z]\w+) from (\d+.\d+.\d+.\d+) port \d+ ssh2/, groups) {print groups[1] groups[2] groups[3] groups[4] groups[5] }' file_to_process.txt > failed_login_data.txt
