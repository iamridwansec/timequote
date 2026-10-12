#!/bin/bash

quotes=(
    "Time is always moving."
    "The future is built from what you do with today."
    "You cannot hold time, only decide how to spend it."
    "Every second becomes a part of your story."
    "Time reveals what patience was building."
)

random_index=$((RANDOM % ${#quotes[@]}))
printf "%s\n" "${quotes[$random_index]}"
echo "— iamridwansec"
