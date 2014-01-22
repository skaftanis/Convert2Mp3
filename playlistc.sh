#!/bin/bash

#this script downloads a whole playlists and convert it in mp3 

#call playlist .sh for the download of the playlist
bash playlist.sh;

#playlist.sh export variables DIR & NAME

cd "$DIR";
cd "$NAME";

timer=0;
(
echo "# Downloading files" 
for i in *.mp4 do
	echo $timer;
	timer=`expr $timer + 1`;
	ffmpeg -i "$i" "i.mp3";
done
) | zenity --progress \
  --title="Convert2mp3" \
  --text="Processing..." \
  --percentage=0 \
  --auto-kill 

notify-send "Playlist download and convert to mp3 completed"