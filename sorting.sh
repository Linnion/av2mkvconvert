#!/bin/bash

#Music Sorter v1.0

#Run in directory you want to sort. Will only work on files using the naming convention "[ARTIST] - [SONG TITLE]".

#Songs already in the directories prior to running this script will be overwritten if a file of the same name is to be copied.

ArtistOnly=$(ls -p | grep -v / | awk 'BEGIN{FS=" - "} {print $1}' | uniq)	#Makes an array containing all of the artist by extracting there names from the filename, using " - " as a delimiter, excluding duplicates.

echo "${ArtistOnly[@]}" | while read Artist	#Reads the filename of each of that artists songs and feeds it into *Artist* variable
do

if [ "$Artist" == "sorting.sh" ]	#Would attempt to create a director for sorting.sh, resulting in error message.
then
	:	#do nothing
else
	mkdir "$Artist"		 #Will display error message if directory already exist, though this won't affect the rest of the script
	SongByArtist=$(ls -p | grep -v / | grep "$Artist" )	#Makes an array containing all of the songs by this artist
	echo "${SongByArtist[@]}" | while read Song	#Reads the filename of each of that artists songs and feeds it into *Song* variable
	do
		mv "$Song" "$Artist"/"$Song"	#Move file from old directory to artist's directory
	done
fi
done



