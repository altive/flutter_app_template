#!/bin/sh

# Specify file path to write dart defines and reset contents.
OUTPUT_FILE="${SRCROOT}/Flutter/Dart-Defines.xcconfig"
: > $OUTPUT_FILE

# Decode Dart-define properties.
function decode_url() { echo "${*}" | base64 --decode; }

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"
do
    item=$(decode_url "${define_items[$index]}")
    # Dart defines also include items defined by Flutter, 
    # but we exclude items that begin with "flutter" or "FLUTTER" because 
    # we cannot start them if we output them.
    lowercase_item=$(echo "$item" | tr '[:upper:]' '[:lower:]')
    if [[ $lowercase_item != flutter* ]]; then
        echo "$item" >> "$OUTPUT_FILE"
    fi
done
