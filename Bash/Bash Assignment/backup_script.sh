#!/bin/bash

# Challenge - Create a script that copies all .txt files from a 
# specified directory to a backup directory. If the backup directory
# doesn;t exist, the script should create it first.

mkdir -p ~/"Backup Folder 2"
cp -r ~/"Arena Boss"/* ~/"Backup Folder 2"

