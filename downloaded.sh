#!/bin/bash

#this script convert a video that you select from your hard drive in mp3 format

#select file from local drive
FILE=`zenity --file-selection `;
if [ $? = 1 ]; then
	exit;
fi

DIR=`zenity --file-selection --directory --title=DestinationFolder`;
if [ $? = 1 ]; then
	exit;
fi
cd $DIR
#convert to mp3
(
echo "0"
echo "Converting Video"
ffmpeg -i "$FILE" "$FILE.mp3";
) |
zenity --progress \
  --title="Convert2mp3" \
  --text="Converting to mp3..." \
  --percentage=0
