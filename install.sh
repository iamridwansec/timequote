#!/bin/bash

printf "%s\n" "Installing timequote..."

if sudo cp timequote.sh /usr/local/bin/timequote; then
    printf "%s\n" "timequote installed successfully."
else
    printf "%s\n" "Installation failed."
    exit 1
fi

if sudo chmod +x /usr/local/bin/timequote; then
    printf "%s\n" "Permissions configured successfully."
else
    printf "%s\n" "Failed to configure permissions."
    exit 1
fi

if command -v timequote >/dev/null 2>&1; then
    printf "%s\n" "Installation complete."
else
    printf "%s\n" "Installation could not be verified."
    exit 1
fi
