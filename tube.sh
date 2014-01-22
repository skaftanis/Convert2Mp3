#!/bin/bash

#this script take a youtube link from youtube, a name and convert it 
#to an mp3 song


#ask info from user
LINK=`zenity --entry --text="Enter the youtube link"`;
if [ $? = 1 ]; then
	exit;
fi
NAME=` zenity --entry --text="Enter the song's name"`;
if [ $? = 1 ]; then
	exit;
fi
DIR=`zenity --file-selection --directory`;
if [ $? = 1 ]; then
	exit;
fi
cd $DIR

(
#download the video
echo "# Downloading file" ; sleep 1;
echo "10" ; sleep 0.1;
youtube-dl --no-playlist -o "$NAME.mp4" "$LINK";
echo "50" ; sleep 0.2;

#convert to mp3
echo "# Converting file to mp3" ; sleep 1;
echo "80" ; sleep 0;
ffmpeg -i "$NAME.mp4" "$NAME.mp3";
#fix .mp4 bug 
NAME=$NAME.mp3;
#mv "$NAME" $DIR;

echo "100";

) | zenity --progress \
  --title="Convert2mp3" \
  --text="Processing..." \
  --percentage=0 \
  --auto-kill 

#delete videogl file
zenity --question --text="Do you want to delete video file? " --title="Convert2mp3;"
if [ $? = 0 ]; then
	rm "$NAME.mp4";
else
	mv "$NAME.mp4" $DIR; 
fi
