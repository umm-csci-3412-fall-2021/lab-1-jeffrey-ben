#!/usr/bin/bash

#Assigns variable to middle file (first argument)
var_middle=$1

#Identifies desired footer and header in directory (second argument)
var_footer=$(find . -name "$2*_footer*")
var_header=$(find . -name "$2*_header*")

#Concatenates all into new file (third argument)
cat "$var_header" "$var_middle" "$var_footer" > "$3"
