#!/bin/bash

# Check if input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <phylip_file>"
    exit 1
fi

input_file=$1
output_file="${input_file%.*}_rightLabels.phy"

# Process the file
{
    # Read and print the first line (header) unchanged
    IFS= read -r header
    echo "$header"
    
    # Process each sequence line
    while IFS= read -r line; do
        # Check if line starts with a sequence label (non-space characters at start)
        if [[ "$line" =~ ^[^[:space:]]+ ]]; then
            # Add caret before the label
            echo "^${line}"
        else
            # Print other lines unchanged (though PHYLIP shouldn't have any)
            echo "$line"
        fi
    done
} < "$input_file" > "$output_file"

echo "Processed file saved as $output_file"
