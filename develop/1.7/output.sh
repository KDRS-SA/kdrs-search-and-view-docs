#!/bin/bash

# Output file
output_file="output.md"

# Clear the output file if it exists
> "$output_file"

# Find all .md files and process them
find . -type f -name "*.md" | while read -r file; do
  # Get the relative path
  relative_path="${file#./}"
  
  # Append the separator and relative path to the output file
  echo "=======" >> "$output_file"
  echo "$relative_path" >> "$output_file"
  echo "=======" >> "$output_file"
  
  # Append the content of the file to the output file
  cat "$file" >> "$output_file"
  
  # Add an extra newline for separation (optional)
  echo >> "$output_file"
done
