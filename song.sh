
#!/bin/bash

ARTIST=`zenity --entry --text="Give Artist Name:"`
if [ $? = 1 ]; then
	exit;
fi
NAME=`zenity --entry --text="Give Song Name:"`
if [ $? = 1 ]; then
	exit;
fi
DIR=`zenity --file-selection --directory`;
if [ $? = 1 ]; then
	exit;
fi
cd $DIR
(
echo "1" 
echo "Downloading Video"
youtube-dl -f mp4 "ytsearch:$ARTIST $NAME album version" 
echo "50"
echo "Converting to mp3"
ffmpeg -i *.mp4 "${ARTIST} - ${NAME}.mp3" 
echo "100"
echo "Done"
) | zenity --progress \
  --title="Prossesing" \
  --text="Please Wait" \
  --percentage=0
  --auto-kill 
if [ $? = 1 ]; then
	exit;
fi

zenity --question --text="Do you want to remove video file" --title="Convert2mp3"
if [ $? = 0 ]; then 
	rm  *.mp4
fi

#mv *.mp3 $DIR
zenity --info --text="Your song has been downloaded successfully"

