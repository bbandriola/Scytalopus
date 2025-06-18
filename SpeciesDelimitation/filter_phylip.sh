#!/bin/bash

# =============================================
# CONFIGURATION - EDIT THESE VALUES
# =============================================
INPUT_FILE="combined_5kb_rightLabels.phy"          # Your PHYLIP file
PATTERNS_TO_EXCLUDE=(
    "^Snovacapitalis152win5kb"
    "^Spachecoi154win5kb"
    "^Sspeluncae33"
    "^Sspeluncae52"
    "^Sspeluncae64"
    "^Ssuperciliariswin5kb"
)
# =============================================

OUTPUT_FILE="${INPUT_FILE%.*}_filtered.phy"

echo "Starting PHYLIP filtering..."
echo "Input file: $INPUT_FILE"
echo "Patterns to exclude:"
printf "  - %s\n" "${PATTERNS_TO_EXCLUDE[@]}"

# Verify input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file $INPUT_FILE not found!" >&2
    exit 1
fi

# Count original lines
TOTAL_LINES=$(wc -l < "$INPUT_FILE")
HEADER_LINES=1

# Create temporary pattern file for grep
PATTERN_FILE=$(mktemp)
printf "%s\n" "${PATTERNS_TO_EXCLUDE[@]}" > "$PATTERN_FILE"

# Process the file with precise filtering
{
    # Preserve header
    head -n 1 "$INPUT_FILE"
    
    # Filter sequences using exact pattern matching
    tail -n +2 "$INPUT_FILE" | grep -vFf "$PATTERN_FILE"
} > "$OUTPUT_FILE"

# Clean up
rm "$PATTERN_FILE"

# Verify results
KEPT_LINES=$(wc -l < "$OUTPUT_FILE")
EXCLUDED_LINES=$((TOTAL_LINES - KEPT_LINES))

echo "Processing complete:"
echo "- Total lines: $TOTAL_LINES"
echo "- Header lines: $HEADER_LINES"
echo "- Sequence lines kept: $((KEPT_LINES - HEADER_LINES))"
echo "- Sequence lines excluded: $EXCLUDED_LINES"
echo "Output saved to: $OUTPUT_FILE"

# Verify output
echo -e "\nFirst few lines of output:"
head -n 5 "$OUTPUT_FILE"
