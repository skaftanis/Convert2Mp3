#!/bin/bash

#with this script you give the starting letters of mp4 file to convert in an mp3

DIR=`cat directory.txt` #read directory name from file

function program {

	ENTRY=`zenity --entry --text="Give the starting letters of mp4" --title="Convert2mp3"`
	if [ $? = 1 ]; then
		exit;
	fi

	cd $DIR;

	if [ $(ls "$ENTRY"*.mp4 | wc -l) = 1 ]; then
		ls "$ENTRY"* > temp;
		RETURN=$(<temp); 

		zenity --question --text="Right mp4 is $RETURN ?" --title "Convert2mp3"

		if [ $? = 0 ]; then 
		(	
		echo "10" ; sleep 1;
		ffmpeg -i "$RETURN" "$RETURN.mp3";
		echo "60" ; sleep 0.5;
		echo "90" ; sleep 0.9;

		) | zenity --progress \
	 	 --title="Convert2mp3" \
	  	--text="Converting..." \
	  	--percentage=0 \
	 	--auto-kill 

		else 

		 	zenity --question --text="Do you want to try again?" --title "Convert2mp3"

		 	if [ $? = 0 ]; then
		 		program;
		 	else
		 		exit;
		 	fi

		fi
	else 
		zenity --question --text="File not found! Maybe there are multiple files starting with $ENTRY. Do you want to try again?" --title="Convert2mp3"
		if [ $? = 0 ]; then
			program;
		else
			exit;
		fi
	

	 fi


}

program; 
