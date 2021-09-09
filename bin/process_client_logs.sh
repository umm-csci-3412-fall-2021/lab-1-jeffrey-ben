#!/usr/bin/bash

cd $1 || exit

cat "$log/*.*" | grep -of "$log_regex" > "failed_login_data.txt"
