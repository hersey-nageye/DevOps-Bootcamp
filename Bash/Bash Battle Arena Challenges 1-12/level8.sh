#!/bin/bash

word_searcher() {
    word="$1" # Setting the first postional argument to the word we're looking for
    directory="$2" # Setting the second positional argument to the directory we want to search

    for file in "$directory"/*.log; do # Iterating through every .log file in the directory entered
        if grep -q "$word" "$file"; then # Use grep to search chosen word in file being iterated over
            echo "Word found in file: $file" 2>/dev/null # Executed if condition is true, if no file is found, supress error message
       
        fi
    done
}

word_searcher "Hate" ~/Arena