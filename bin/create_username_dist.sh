#!/usr/bin/bash

temp_file="$(mktemp /tmp/temp_file.XXXXXX)"


cd "$1" || exit
