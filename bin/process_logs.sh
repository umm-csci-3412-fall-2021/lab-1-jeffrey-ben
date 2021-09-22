#!/usr/bin/bash

#Marks starting directory
start_dir=$(pwd)

#Creates temperary directory 
temp_dir=$(mktemp -d)

#Loops through every arguement
#Creates a file named after basename of the argument in the termperary file
#Unzips the contents of the argument file into the new created directory
#Runs process_client_logs in the given directory
for arg_file in "$@"; do
	dir_base=$(basename -s "_secure.tgz" "$arg_file")
	mkdir "$temp_dir"/"$dir_base"
	tar -xzf "$arg_file" -C "$temp_dir"/"$dir_base"
	./bin/process_client_logs.sh "$temp_dir"/"$dir_base"
done

#Runs create_username_dist in temperary directory
./bin/create_username_dist.sh "$temp_dir"

#Runs create_hours_dist in temperary directory
./bin/create_hours_dist.sh "$temp_dir"

#Runs create_country_dist in temperary directory
./bin/create_country_dist.sh "$temp_dir"

#Runs assemble_report in temperary directory
./bin/assemble_report.sh "$temp_dir"

#Moves summary data to start directory
mv "$temp_dir"/failed_login_summary.html "$start_dir"

#removes the temperary directory
rm -r "$temp_dir"


