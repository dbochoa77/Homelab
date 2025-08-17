#!/usr/bin/env bash

# Usage: ./printAll.sh /path/to/dir output.txt

TARGET_DIR="${1:-.}"             # Default to current directory if not provided
OUTPUT_FILE="${2:-allCode.txt}"     # Default output file name

# Clear or create output file
> "$OUTPUT_FILE"

# Add directory tree structure (ignoring .git)
echo "===== DIRECTORY STRUCTURE =====" >> "$OUTPUT_FILE"
tree -I ".git" "$TARGET_DIR" >> "$OUTPUT_FILE"
echo -e "\n===== FILE CONTENTS =====" >> "$OUTPUT_FILE"

# Loop through all files except inside .git and append content
find "$TARGET_DIR" -type f ! -path "*/.git/*" | while read -r file; do
    echo -e "\n===== $file =====" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
done

echo "✅ All contents saved to $OUTPUT_FILE"

