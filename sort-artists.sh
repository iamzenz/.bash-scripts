#!/bin/bash

# Base directory where the albums are currently located
BASE_DIR="/vault/downloads/music"

# Destination base directory for sorted music
DEST_DIR="/vault/music"

# Loop through each directory in the BASE_DIR
find "$BASE_DIR" -maxdepth 1 -mindepth 1 -type d | while read -r dir; do
    # Extract the directory name without the BASE_DIR path
    dir_name=$(basename "$dir")

    # Extract the artist name by cutting the string up to the first dash
    artist=$(echo "$dir_name" | cut -d '-' -f1 | xargs)

    # Create the artist directory in the destination if it doesn't exist
    mkdir -p "$DEST_DIR/$artist"

    # Move the album directory to the artist directory
    mv "$dir" "$DEST_DIR/$artist/"

    echo "Moved $dir to $DEST_DIR/$artist/"
done

echo "All albums have been sorted into their respective artist directories."
