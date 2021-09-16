#!/usr/bin/bash




temp_file="$(mktemp /tmp/temp_file.XXXXXXXXX)"
temp_file_1="$(mktemp /tmp/temp_file.XXXXXXXXX)"
startd="$(pwd)"

#Goes into arguement file
cd "$1" || exit

#Concatenates all "failed_login_txt" files into a single text file
#Prints out the 5th column, it being the IP field
#Sorts it
#Arranges them in order of how many occur in file
#Uses awk to print the 5th column into the html format
#Pushes it into the temp file
cat ./*/failed_login_data.txt | awk '{ print $5 }' | sort > "$temp_file"

sort "$startd/etc/country_IP.txt" |  join "$temp_file" - | awk '{ print $2 }' | uniq -c > "$temp_file_1" 

cd "$startd" || exit

#Run wrap contents
./bin/wrap_contents.sh "$temp_file_1" html_components/country_dist "$1"/country_dist.html


#Remove temp file
#rm "$temp_file"
#rm "$temp_file_1"
