#!/bin/bash

# This script automates the creation of .png thumbnails for .usdz files
# using a custom Swift executable (usdz_thumbnailer).
# It then calls generate_index.sh to create the index.html.

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
echo "--- Calling generate_index.sh to create index.html ---"
# Ensure generate_index.sh is executable
if [ ! -f "./generate_index.sh" ]; then
    echo "Error: generate_index.sh script not found. Please ensure it's in this directory."
    exit 1
fi
chmod +x ./generate_index.sh # Ensure it's executable for this run
./generate_index.sh

echo "--- All processes finished. ---"

