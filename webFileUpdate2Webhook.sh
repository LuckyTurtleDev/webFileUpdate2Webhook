#!/bin/bash
set -e
set -u


filename="downloads/${1///}"
output="download $1"
echo "$output"
newfile=`curl --silent $1`
if [ ! -f "$filename" ];
then
    output="file $filename not found"
    echo "$output"
    if [ ! -d "downloads" ];
    then
    	echo "create folder downloads"
    	mkdir downloads
	fi
    echo "save file"
    echo "$newfile" > "$filename"
    exit
fi
oldfile=`cat $filename`
if [ $# -ge 3 ]
then
	oldfile=`echo "$oldfile" | sed $3`
	newfileEdit=`echo "$newfile" | sed $3`
else
	newfileEdit=newfile
fi
if [ "$oldfile" = "$newfileEdit" ] 
then
	echo "no changes"
else
	echo "changes"
	echo "save file"
	echo "$newfile" > "$filename"
	output="weebhook $2"
	echo "weebhook $2"
	curl --silent -X POST "$2"
fi
