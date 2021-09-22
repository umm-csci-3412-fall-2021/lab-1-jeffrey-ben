#!/usr/bin/bash

var_middle=$1

var_footer="$2_footer.html"
var_header="$2_header.html"

cat "$var_header" "$var_middle" "$var_footer" > "$3"
