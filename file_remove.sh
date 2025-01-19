#!/bin/bash

# Define the alias
alias file_remove='function _file_remove() {
    if [ -z "$1" ]; then
        echo "Error: No directory specified."
        return 1
    fi

    target_dir="$1"

    if [ ! -d "$target_dir" ]; then
        echo "Error: Directory '$target_dir' does not exist."
        return 1
    fi

    # Find and delete all files in the target directory while keeping subdirectories intact
    find "$target_dir" -maxdepth 1 -type f -exec rm -f {} +

    echo "All files in directory '$target_dir' have been removed, but subdirectories are intact."
}; _file_remove'

# Inform the user how to use the alias
echo "Alias 'file_remove' created. Use it like this: file_remove <target_directory>"

