#!/bin/bash

# This script automates the creation of .png thumbnails for .usdz files
# using a custom Swift executable (usdz_thumbnailer).
# It then calls generate_index_with_USDZ.sh to create the index.html.

echo "--- Starting USDZ Thumbnail Generation (using Swift) ---"

# Define the path to the Swift executable
SWIFT_THUMBNAILER="./usdz_thumbnailer"

# Check if the Swift executable exists
if [ ! -f "$SWIFT_THUMBNAILER" ]; then
    echo "Error: Swift thumbnailer executable '$SWIFT_THUMBNAILER' not found."
    echo "Please ensure 'usdz_thumbnailer.swift' is compiled into 'usdz_thumbnailer' in this directory."
    echo "You can compile it using: swiftc usdz_thumbnailer.swift -o usdz_thumbnailer"
    exit 1
fi

# Run the Swift thumbnailer.
# The Swift script handles iterating through files, checking for existing thumbnails,
# and generating new ones. It also handles filenames with spaces.
echo "Running Swift thumbnailer for all .usdz files in the current directory..."
"$SWIFT_THUMBNAILER" "$(pwd)"

# Check the exit status of the Swift script
if [ $? -eq 0 ]; then
    echo "--- USDZ Thumbnail Generation Complete (via Swift) ---"
else
    echo "--- USDZ Thumbnail Generation encountered errors (via Swift) ---"
    echo "Please check the 'usdz_thumbnailer.log' file for details."
fi


# Now, call the script to generate the index.html with the new thumbnails
echo "--- Calling generate_index_with_USDZ.sh to create index.html ---"
# Define the path to the index generation script
INDEX_GENERATOR_SCRIPT="./generate_index_with_USDZ.sh"

# Ensure generate_index_with_USDZ.sh is executable
if [ ! -f "$INDEX_GENERATOR_SCRIPT" ]; then
    echo "Error: '$INDEX_GENERATOR_SCRIPT' script not found. Please ensure it's in this directory."
    exit 1
fi
chmod +x "$INDEX_GENERATOR_SCRIPT" # Ensure it's executable for this run
"$INDEX_GENERATOR_SCRIPT"

echo "--- All processes finished. ---"

