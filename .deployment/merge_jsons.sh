#!/bin/bash

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install jq first."
    exit 1
fi

# Check if both files are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <base.json> <override.json> <output.json>"
    exit 1
fi

BASE_JSON=$1
OVERRIDE_JSON=$2
OUTPUT_JSON=$3

# Check if files exist
if [ ! -f "$BASE_JSON" ]; then
    echo "Error: Base JSON file '$BASE_JSON' not found!"
    exit 1
fi

if [ ! -f "$OVERRIDE_JSON" ]; then
    echo "Error: Override JSON file '$OVERRIDE_JSON' not found!"
    exit 1
fi

# Merge JSON files with override.json taking precedence
jq -s '.[0] * .[1]' "$BASE_JSON" "$OVERRIDE_JSON" > "$OUTPUT_JSON"

echo "Merged JSON saved to $OUTPUT_JSON"