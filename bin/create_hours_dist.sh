#!/usr/bin/bash

temp_file="$(mktemp /tmp/temp_file.XXXXXXXXX)"
startd="$(pwd)"

cd "$1" || exit


cat ./*/failed_login_data.txt | awk '{ print $3 }' | sort | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);"}' > "$temp_file"

cd "$startd" || exit


./bin/wrap_contents.sh "$temp_file" html_components/hours_dist "$1"/hours_dist.html

rm "$temp_file"

