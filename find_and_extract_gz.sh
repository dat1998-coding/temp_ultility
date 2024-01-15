#!/bin/bash

# Check if argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

dir=$1

# Find and extract tar.gz files
find "$dir" -type f -name "*.tar.gz" -print0 | while IFS= read -r -d '' file; do
    echo "Extracting $file..."
    tar -xzf "$file" -C "$(dirname "$file")"
done

# List extracted files
echo "Listing all files in $dir:"
find "$dir" -type f
