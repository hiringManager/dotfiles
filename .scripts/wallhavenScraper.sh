#!/bin/bash

# Settings you should change
######################################################

# Minimum resolution
res="1920x1080"

# Where to download the wallpapers to
location="$HOME/Pictures/Wallpapers/"

######################################################
# Wouldnt reccomend touching anything below this line

echo "Location = "$location

# Error message
error="Your response must be 'y', 'n' or Return"

# Function to assign your choice of categories and purity to true or false
prompt() {
	local question answer
	question="$1"

	until [[ ${answer} == y ]] || [[ ${answer} == n ]]
	do
		read -rp "${question^} [y/n] " answer
		answer=${answer:-y}
		answer=${answer,,}
	done

	[[ ${answer} == y ]] && echo 1 || echo 0
}

# Choose your categories
general=$(prompt "general")
anime=$(prompt "anime")
people=$(prompt "people")

categories="${general}${anime}${people}"
echo "${categories}"

# Choose your purity
nsfw=$(prompt "sfw")
sketchy=$(prompt "sketchy")
sfw=$(prompt "nsfw")

purity="${sfw}${sketchy}${nsfw}"
echo "${purity}"

curl -s https://wallhaven.cc/api/v1/search\?categories\=$categories\?purity\=$purity\?atleast\=$res\&page\=$i > tmp.txt
  page=$(cat tmp.txt | jq '.' | grep -Eoh "https:\/\/w\.wallhaven.cc\/full\/.*(jpg|png)\b")
  wget -nc -P $location $page
