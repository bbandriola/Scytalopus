# File containing the list of files (one per line, full paths)
LIST=$1

# Output file
OUT=$2                                   

# Clear output
> "$OUT"

for i in $(cat "$LIST"); do
    echo "$i" >> "$OUT"
    cat "$i" >> "$OUT"
done
