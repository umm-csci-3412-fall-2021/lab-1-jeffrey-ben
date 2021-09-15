#!/usr/bin/bash

temp_file="$(mktemp /tmp/temp_file.XXXXXXXXX)"
startd="$(pwd)"

#Goes into arguement file
cd "$1" || exit

#Concatenates all "failed_login_txt" files into a single text file
#Prints out the 3th column, it being the hour field
#Sorts it
#Arranges them in order of how many occur in file
#Uses awk to print the 1st and 2nd column into the html format
#Pushes it into the temp file
cat ./*/failed_login_data.txt | awk '{ print $3 }' | sort | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);"}' > "$temp_file"



cd "$startd" || exit

#Run wrap contents
./bin/wrap_contents.sh "$temp_file" html_components/hours_dist "$1"/hours_dist.html


#Remove temp file
rm "$temp_file"

