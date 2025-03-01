#!/bin/bash

battlefield() { # Function creates a new directory and three files within the same directory
    mkdir -p ~/Battlefield
    cd ~/Battlefield
    touch ~/Battlefield/{rogue.txt,sorcerer.txt,knight.txt}
}

battlefield # Function is called


if [ -f ~/Battlefield/knight.txt ]; then  # if the file is found, a new directory is created and the file is moved there
    mkdir -p ~/Archive
    mv knight.txt ~/Archive
fi

ls ~/Battlefield ~/Archive # list contents of both directories
