#!/bin/bash

# File that contains FULL PATHS to fasta files
#FILE_LIST="files_list.txt"

# Output file (you specify it here)
#OUTPUT="./result_selected_fafiles50kb.txt"
FILE_LIST="$1"
OUTPUT="$2"


# Clear previous output
> "$OUTPUT"

# Read full paths from list file
while IFS= read -r filepath; do
    # Skip empty lines
    [[ -z "$filepath" ]] && continue

    if [[ -f "$filepath" ]]; then
        echo "Results for $filepath:" >> "$OUTPUT"
        seqkit fx2tab --length --header-line -n "$filepath" >> "$OUTPUT"
    else
        echo "WARNING: File not found -> $filepath" >> "$OUTPUT"
    fi
done < "$FILE_LIST"
