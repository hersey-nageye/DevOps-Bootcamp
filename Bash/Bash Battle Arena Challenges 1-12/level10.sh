#/bin/bash

boss_battle_2() {
    mkdir -p ~/"Arena Boss" # Create a directory called "Arena Boss" in our home directory
    cd ~/"Arena Boss" # Navigate into it
    for file in file{1..5}.txt; do 
        touch "$file" # For loop creates 5 file.txt files
        shuf -i 1-100 -n $((RANDON % 11 + 10)) > "$file" # Generate random number (1-100) on each file between a random number of lines between 10 and 20
        ls -S ~/"Arena Boss"/"$file" # printing the list of files to standard output accroding to size
        if grep -q "Victory" "$file"; then # if 'Victory' is found in any of the files..
            mv "$file" ~/"Victory Archive" # then we move this file to a new directory called "Victory Archive"
        fi
    done
}
boss_battle_2