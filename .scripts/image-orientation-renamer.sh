#!/bin/bash

# Rename all of the images first (requires shell script from .scripts)
~/.scripts/complex-renamer

# Create directories
mkdir -p portrait
mkdir -p landscape

# Specify the directory containing the images
image_dir="./"

# Iterate through the image files
for file in "$image_dir"/*; do
  # Check if the file is an image
  if [[ -f "$file" && $(file -b --mime-type "$file" | grep -i 'image') ]]; then
    # Get the width and height using ImageMagick's identify command
    dimensions=$(identify -format "%w %h" "$file")
    width=$(echo "$dimensions" | awk '{print $1}')
    height=$(echo "$dimensions" | awk '{print $2}')

    # Compare width and height to determine aspect ratio
    if (( width > height )); then
      # Move landscape image to the Landscape directory
      mv "$file" landscape/
      echo "Moved $file to Landscape directory."
    else
      # Move portrait image to the Portrait directory
      mv "$file" portrait/
      echo "Moved $file to Portrait directory."
    fi
  fi
done

