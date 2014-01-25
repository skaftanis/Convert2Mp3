#!/bin/bash

#this script downloads a whole playlists and convert it in mp3 

#call playlist .sh for the download of the playlist
#!/bin/bash

#this script simply download a whole plalist from youtube

LINK=`zenity --entry --text="Give youtube link" --title="Convert2mp3"`
if [ $? = 1 ]; then
	exit;
fi

NAME=` zenity --entry --text="Enter a playlist's name"`;
if [ $? = 1 ]; then
	exit;
fi

DIR=`zenity --file-selection --directory`;
if [ $? = 1 ]; then
	exit;
fi

cd "$DIR"; 
mkdir "$NAME";
cd "$NAME";


(
echo "# Downloading files" ; sleep 1;
echo "10" ; sleep 1;
echo "50" ; sleep 0.3;
youtube-dl --format mp4 "$LINK"; 
echo "90" ; sleep 0.1;
echo "100" ; sleep 0;
) | zenity --progress \
  --title="Convert2mp3" \
  --text="Processing..." \
  --percentage=0 \
  --auto-kill 


timer=0;
(
echo "# Converting files" 
for i in *.mp4 
do 
	echo "50"
	echo $timer;
	timer=`expr $timer + 1`;
	ffmpeg -i "$i" "$i.mp3";
	echo "100"
done
) | zenity --progress \
  --title="Convert2mp3" \
  --text="Processing..." \
  --percentage=0 \
  --auto-kill 

notify-send "Playlist download and convert to mp3 completed"
