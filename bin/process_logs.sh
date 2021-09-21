#!/usr/bin/bash

start_dir=$(pwd)
temp_dir=$(mktemp -d)

for arg_file in "$@"
do 
	dir_base=$(basename -s "_secure.tgz" "$arg_file")
	mkdir "$temp_dir"/"$dir_base"
	arg_dir="$temp_dir"/"$dir_base"
	tar -xf "$arg_file" -C "$arg_dir"
	./bin/process_client_logs "$arg_dir"
done



