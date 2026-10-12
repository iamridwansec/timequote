#!/bin/bash
if [ "$1" = "--help" ]; then
    printf "%s\n" "Usage: timequote.sh [option]"
    printf "%s\n" ""
    printf "%s\n" "Options:"
    printf "%s\n" "  --help    Show this help message"
    exit 0
fi


quotes=(
    "Time is always moving."
    "The future is built from what you do with today."
    "You cannot hold time, only decide how to spend it."
    "Every second becomes a part of your story."
    "Time reveals what patience was building."
)

if [ "$1" = "--count" ]; then
    count=$2

    if [ "$count" -gt 3 ]; then
        printf "%s\n" "Maximum count is 3."
        exit 1
    fi

    for ((i=0; i<count; i++)); do
        random_index=$((RANDOM % ${#quotes[@]}))
        quote="${quotes[$random_index]}"

        separator=""
        for ((j=0; j<${#quote}; j++)); do
            separator="${separator}-"
        done

        printf "%s\n" "$separator"
        printf "%s\n" "$quote"
        printf "%s\n" "~ iamridwansec"
        printf "%s\n" "$separator"
    done

    exit 0
fi
