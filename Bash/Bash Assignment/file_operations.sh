#!/bin/bash

# Challenge - Write a script that creates a directory, navigates into it,
# creates a file inside it, writes some text to the file,
# and then displays the content of that file.

mkdir -p ~/"File 1"
cd ~/"File 1"
touch ~/"File 1"/random.txt
echo "This is a random text file" > ~/"File 1"/random.txt
cat ~/"File 1"/random.txt