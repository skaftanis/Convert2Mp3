#!/bin/bash

#this script find the latest .mp4 file and convert it to mp3 if if it have users approval


	FOLDER=`cat directory.txt`; #default directory ~/Music #TODO #DONE

while :; do 

	cd $FOLDER;

	find -maxdepth 1 -name '*.mp4' > temp; #find mp4s in default setted folder (sort by time)
	FILE=`head -n 1 temp`;  #save the first line (newest)

	FILE=${FILE:2}; # cut ./ chars comming from find command

	#FILE=`ls -t1 | head -n1`
	if [ -s temp ]; then
 		zenity --question --text="Convert $FILE ?";
 	else
 		zenity --info --text="There is no mp4 file in this directory $FOLDER"; 
 		DIR=`zenity --file-selection --directory`;
 		if [ $? = 1 ]; then
			exit;
		fi   
 	fi

 	if [ $? = 0 ]; then 
 		ffmpeg -i "$FILE" "$FILE.mp3";
 		notify-send "$FILE converted";
 		exit;
 	else
 		zenity --info --text="Then..choose the directory you want";
 		if [ $? = 1 ]; then
			exit;
		fi
 		DIR=`zenity --file-selection --directory`;
 		if [ $? = 1 ]; then
			exit;
		fi 
 		FOLDER=$DIR ;
 	fi

done
 
rm temp;
