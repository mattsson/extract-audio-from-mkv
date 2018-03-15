#!/bin/bash

# This script will extract an audio track from a .mkv file
# Usage: bash extract_audio.sh Shark.Tank.S10.E09.mkv

file_name=$1

mkvinfo ${file_name}

echo -e "\n\nPlease enter audio track number"

read -p 'Audio track number: ' audio_track_number

mkvextract tracks ${file_name} ${audio_track_number}:${file_name}.unknown

ffmpeg -i ${file_name}.unknown -vn -ar 44100 -ac 2 -ab 128k ${file_name}.mp3

rm ${file_name}.unknown

# faad -d -o ${file_name}.wav ${file_name}.aac

# lame -V2 ${file_name}.wav ${file_name}.mp3

# faad -d -o Shark.Tank.S09E10.720p.HDTV.X264-UAV.mkv.wav Shark.Tank.S09E10.720p.HDTV.X264-UAV.mkv.aac
