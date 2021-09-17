#!/usr/bin/bash




temp_file="$(mktemp /tmp/temp_file.XXXXXXXXX)"
startd="$(pwd)"

#Goes into arguement file
cd "$1" || exit

#Concatenates all "failed_login_txt" files into a single text file
#Prints out the 5th column, it being the IP field
#Sorts it
#Arranges them in order of how many occur in file
#Uses awk to print the 5th column into the html format
#Pushes it into the temp_IP file
cat ./*/failed_login_data.txt | awk '{ print $5 }' | sort > temp_IP.txt

#Gets the IP map file and sorts it
#Then moves it into a temperary file
sort "$startd"/etc/country_IP_map.txt > country_IP_map_sorted.txt

#Joins the two files together
#Prints the desired column
#Sorts it and enumerates the recurring instances
#Prints it all and moves it into the temp folder
join temp_IP.txt country_IP_map_sorted.txt | awk '{print $2}' | sort | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);"}' > "$temp_file"

#Removes uneeded, previous files
rm temp_IP.txt
rm country_IP_map_sorted.txt


cd "$startd" || exit

#Run wrap contents
./bin/wrap_contents.sh "$temp_file" html_components/country_dist "$1"/country_dist.html


#Removes unneccessary files
rm "$temp_file"

