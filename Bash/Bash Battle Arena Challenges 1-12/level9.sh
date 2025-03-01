#!/bin/bash


monitor() {
    directory="$1" # Setting the first positional argument to the variable 'directory'
    while true; do # While true allows us to run the loop indefintely
        inotifywait -m -e create,delete,modify --format '%T %w %f %e' --timefmt '%Y-%m-%d %H:%M:%S' ~/Arena >> ~/log.txt
    done
}
monitor ~/Arena &