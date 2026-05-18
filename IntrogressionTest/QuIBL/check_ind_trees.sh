#!/bin/bash

# Input file containing multiple trees
input="/media/labgenoma5/DATAPART3/bandriola/Scytalopus/IQtree_windows/10Ind/run1/all_trees_1kb_10ind.newick"

# Output file for trees containing all individuals
output="allind_trees.newick"

# List of required individuals
required_inds=(
    "Sspeluncae120"
    "Sspeluncae16"
    "Sspeluncae140"
    "Sspeluncae87"
    "Sspeluncae122"
    "Sspeluncae139"
    "Sspeluncae95"
    "Sspeluncae73"
    "Sspeluncae116"
    "Sspeluncae83"
)

# Clear output file if it already exists
> "$output"

# Read each tree line by line
while IFS= read -r tree; do

    all_present=1

    # Check if all individuals are present
    for ind in "${required_inds[@]}"; do
        if [[ "$tree" != *"$ind"* ]]; then
            all_present=0
            break
        fi
    done

    # If all individuals are present, save tree
    if [[ $all_present -eq 1 ]]; then
        echo "$tree" >> "$output"
    fi

done < "$input"

echo "Finished checking trees."
echo "Trees containing all individuals were saved in: $output"
