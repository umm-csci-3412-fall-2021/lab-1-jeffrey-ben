#!/usr/bin/bash

var_middle=$1

var_footer=$(find . -name "$2*_footer*")
var_header=$(find . -name "$2*_header*")

cat "$var_header" "$var_middle" "$var_footer" > "$3"
