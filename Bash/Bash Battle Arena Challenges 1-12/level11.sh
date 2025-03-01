#!/bin/bash

disk_space_report() {
    directory="$1" # Assign the 1st positional argument to the variable 'directory'
    while true; do # Evaluate while to true to execute the code block below
        disk_usage="$(du -s "$directory" | cut -f1)" # We set the value to disk_usage to the output of the disk usage of the argument. We also cut the 1st column to only return an integer.
        if [ "$disk_usage" -gt 50 ]; then
            echo "Houston, we have a problem with this file: $directory"
        fi
        sleep 10 # We run the while loop every 10 seconds to reduce CPU usage. This figure can be amended.
    done
}
disk_space_report ~/Backup
