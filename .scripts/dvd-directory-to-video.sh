#!/bin/bash

# This is a one-liner to convert a raw dvd directory with ffmpeg
cat ./VIDEO_TS/*.VOB | ffmpeg -i - <out_name>.<out_format>
