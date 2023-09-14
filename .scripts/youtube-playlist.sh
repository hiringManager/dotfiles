#!/bin/bash

# Rip playlist to a directory and convert it to mp3

# Requires yt-dlp and ffmpeg (pip install yt-dlp ; sudo apt install ffmpeg)

# Usage
# youtube-playlist.sh <playlist url>

mkdir output                                           ;
cd output                                              ;

# yt-dlp -x extracts only the audio
PLAYLIST="$1"                                          ;
yt-dlp -x $PLAYLIST                                    ;

# Convert files to mp3
for i in *.opus; do ffmpeg -i "$i" "${i%.*}.mp3"; done ;
for i in *.m4a; do ffmpeg -i "$i" "${i%.*}.mp3"; done  ;

# Organizing Files
mkdir opus                                             ;
mkdir mp3                                              ;
mv *.mp3 ./mp3                                         ;
mv *.opus ./opus                                       ;
