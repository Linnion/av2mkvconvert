#!/bin/bash

fnames=$(ls -p | grep -v / | awk 'BEGIN{FS=".av"} {print $1}')

echo "${fnames[@]}" | while read newfn
do

if [ "$newfn" == "av_convert.sh" ]
then
	:
else
	mkvmerge -v -o "$newfn".mkv "$newfn".av #Insert MKV conversion here
fi
done
