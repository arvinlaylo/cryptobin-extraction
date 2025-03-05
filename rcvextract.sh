#!/bin/bash

# Set directories (modify these paths as needed)
SOURCE_DIR="/home/aaicom6/aai_epson_interface/storage/app/cvrecvmsg/"                                                     # Directory containing .zip files
DEST_DIR="/home/aaicom6/aai_epson_interface/storage/app/crypinbound/"      # Directory where .zip files will be moved after extraction
EXTRACT_DIR="/home/aaicom6/aai_epson_interface/storage/app/private/cryptobin_incoming_source/"    # Directory where extracted files will be placed

# Create directories if they don't exist
mkdir -p "$DEST_DIR"
mkdir -p "$EXTRACT_DIR"

# Loop through all .zip files in the source directory
for zip_file in "$SOURCE_DIR"/*.zip; do
    # Check if any zip files exist before processing
    [ -e "$zip_file" ] || continue
    
    echo "Extracting: $zip_file"

    # Extract .zip file to the extraction folder
    if unzip -o "$zip_file" -d "$EXTRACT_DIR"; then
        echo "Extraction successful, moving file to $DEST_DIR"
        mv "$zip_file" "$DEST_DIR"
    else
        echo "Extraction failed: $zip_file"
    fi
done

echo "Process completed!"
