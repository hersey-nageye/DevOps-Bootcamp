#!/bin/bash

txt_file_sort() {
    directory="$1" # Assign the first positional argument to directory
    ls -Sr "$directory"/*.txt 2>/dev/null # sort all .txt files found in size order. If .txt files not found, SE dicarded into /dev/null
}
txt_file_sort ~/Arena