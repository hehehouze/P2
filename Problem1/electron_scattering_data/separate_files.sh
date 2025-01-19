#!/bin/bash

# Create directories for odd and even files
mkdir -p odd even

# Loop through all files in the current directory
for file in electron_scattering_*; do
    # Extract the index from the file name using pattern matching
    index=$(echo "$file" | grep -oP 'index_\K\d+')
    
    # Check if the index is odd or even
    if [ $((index % 2)) -eq 0 ]; then
        # Move even-indexed files to the 'even' directory
        mv "$file" even/
    else
        # Move odd-indexed files to the 'odd' directory
        mv "$file" odd/
    fi
done

echo "Files have been separated into 'odd' and 'even' directories."

