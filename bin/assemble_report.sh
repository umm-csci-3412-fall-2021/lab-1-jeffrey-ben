#!/usr/bin/bash
startd="$(pwd)"

#Moves into desired directory
cd "$1" || exit

#Concatonates all desired files together
cat country_dist.html hours_dist.html username_dist.html > summary.html

#Goes back to original directory
cd "$startd" || exit 

#wraps the contents
./bin/wrap_contents.sh "$1"/summary.html html_components/summary_plots failed_login_summary.html

#removes unneeded file
rm "$1"/summary.html

#moves file to desired directory
mv failed_login_summary.html "$1"
