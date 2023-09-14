#!/bin/bash

# Script to add basic frontmatter to .md files

input="./*.md"
stat=$(stat -c '%w' "$input")

# Frontmatter
fm="---
title: '$input'
date: '$stat'
draft = false
---
"

#cleanup
echo "$fm" >> tmp
cat $input >> tmp
rm $input
mv tmp $input

# to do
# Format date properly
# Traverse directories

# in python
#def prepend_text(filename: Union[str, Path], text: str):
#    with fileinput.input(filename, inplace=True) as file:
#        for line in file:
#            if file.isfirstline():
#                print(text)
#            print(line, end="")
