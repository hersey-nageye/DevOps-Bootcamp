#!/bin/bash

# Challenge - Write a script that checks if a file exists and 
# prints a message whether it exists or not. If it exists
# the script should also check if the file is readable, writable
# or executable.


file_checker() {
    filename="$1"

    ls -l ~/"$filename" >/dev/null 2>&1 # redirecting stdout and stderr to /dev/null to completely supress output of ls
    
    if [[ -f ~/"$filename"  ]]; then
        echo "This file exists on your home directory"
     if [[ -r ~/"$filename" && -w ~/"$filename" && -x ~/"$filename" ]]; then # Nested if statement to ensure existant files are checked
            echo "The file has read, write and executable permissions"
        elif [[ -r ~/"$filename" && -w ~/"$filename" ]]; then
            echo "The file has read and write permissions"
        elif [[ -r ~/"$filename" && -x ~/"$filename" ]]; then
            echo "The file has read and execute permissions"
        elif [[ -w ~/"$filename" && -x ~/"$filename" ]]; then
            echo "the file has write and execute permissions"
        elif [[ -r ~/"$filename" ]]; then
            echo "The file only has read permissions"
        elif [[ -w ~/"$filename" ]]; then
            echo "The file only has write permissions"
        elif [[ -x ~/"$filename" ]]; then
            echo "The file only has executable permissions"
        else
            echo "The file has no permissions"
        fi
    else
        echo "File doesn't exist"
    fi
}

file_checker arsenal.txt

