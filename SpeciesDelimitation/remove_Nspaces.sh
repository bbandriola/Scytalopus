#!/bin/bash

# Check if input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <phylip_file>"
    exit 1
fi

input_file="$1"
output_file="${input_file%.*}_noNspaces.phy"

# Process the file
awk '
function clean_sequence(s) {
    result = ""
    n = length(s)
    i = 1
    while (i <= n) {
        c = substr(s, i, 1)
        # If current character is N and next is space and following is N
        if (c == "N" && substr(s, i+1, 1) == " " && substr(s, i+2, 1) == "N") {
            result = result c
            i += 2  # skip the space
        } else {
            result = result c
            i++
        }
    }
    return result
}

{
    # Header line (keep unchanged)
    if (NR == 1) {
        print $0
        next
    }
    
    # Sequence lines
    if ($0 ~ /^[^ ]+ +[ACGTNacgtn ]+$/) {
        # Split into name and sequence
        name = $1
        seq_start = match($0, /[ACGTNacgtn ]+$/)
        seq = substr($0, seq_start)
        
        # Clean the sequence portion
        cleaned_seq = clean_sequence(seq)
        
        # Reconstruct the line
        printf "%s %s\n", name, cleaned_seq
    } else {
        # Other lines (clean any sequence portions)
        print clean_sequence($0)
    }
}' "$input_file" > "$output_file"

echo "Successfully removed spaces between Ns. Output saved to $output_file"

