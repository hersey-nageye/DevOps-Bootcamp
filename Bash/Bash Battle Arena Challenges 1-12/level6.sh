#!/bin/bash

argument_parsing() {
    filename="$1" # Assign the first positional argument to the variable
    if [ -z $filename ]; then # if the argument isn't found
        echo "No file provided"
    elif [ -f $filename ]; then ~ # if the argument is present
        wc -l < $filename # Input redirection to prevent filename from being outputted
    fi
}
argument_parsing hello.txt