#!/bin/bash
DATE=$(date +%F)

# Loop through all files in the current directory
for FILE in *.png
do
    # Check if $FILE is a regular file (not a directory)
    if [ -f "$FILE" ]; then
        echo "Renaming $FILE to ${DATE}-${FILE}"
        mv "$FILE" "${DATE}-${FILE}"
    else
        echo "Skipping $FILE (not a regular file)"
    fi
done
