#!/bin/bash

# This script automates the creation of .png thumbnails for .usdz files
# using macOS's built-in qlmanage tool.
# After generating thumbnails, it calls generate_index.sh to create the index.html.

echo "--- Starting USDZ Thumbnail Generation ---"

# Check if qlmanage is available (it should be on macOS)
if ! command -v qlmanage &> /dev/null
then
    echo "Error: qlmanage command not found. This script requires macOS."
    exit 1
fi

# Set IFS to newline to correctly handle filenames with spaces
IFS=$'\n'

# Find all .usdz files in the current directory
USDZ_FILES=$(ls -1 *.usdz 2>/dev/null | sort)

if [ -z "$USDZ_FILES" ]; then
    echo "No .usdz files found in the current directory. Skipping thumbnail generation."
else
    for usdz_file in $USDZ_FILES; do
        # Define the output PNG filename
        png_file="${usdz_file%.usdz}.png"

        echo "Generating thumbnail for: \"$usdz_file\" -> \"$png_file\""

        # Use qlmanage to generate the thumbnail
        # -t: generate thumbnail
        # -s 256: set size to 256x256 pixels (you can adjust this)
        # -o .: output to the current directory
        # "$usdz_file": the input USDZ file (quoted to handle spaces)
        qlmanage -t -s 256 -o . "$usdz_file" > /dev/null 2>&1

        # qlmanage creates files with an extra .png extension if the original file has no extension
        # or if the output format is forced. Let's ensure the correct name.
        # It often creates a file like "filename.usdz.png". We want "filename.png".
        if [ -f "${usdz_file}.png" ]; then
            mv "${usdz_file}.png" "$png_file"
            echo "Renamed ${usdz_file}.png to $png_file"
        fi

        if [ -f "$png_file" ]; then
            echo "Thumbnail created successfully: $png_file"
        else
            echo "Warning: Could not create thumbnail for $usdz_file. qlmanage might not support this specific USDZ variant."
        fi
    done
fi

# Reset IFS to its default value
unset IFS

echo "--- USDZ Thumbnail Generation Complete ---"

# Now, call the script to generate the index.html with the new thumbnails
echo "--- Calling generate_index.sh to create index.html ---"
./generate_index.sh

echo "--- All processes finished. ---"

