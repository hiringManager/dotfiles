#!/usr/bin/env bash

# Save this file as "xkcd"

URL=https://xkcd.com/ 

if [ $# -gt 0 ] && [ $1 = "-r" ]
then
 URL=https://c.xkcd.com/random/comic
fi

img=$(curl -s -L $URL | 
grep 'href= "https://imgs.xkcd.com/comics.*' | 
cut -d> -f2 | 
cut -d< -f1)

kitty +kitten icat $img
