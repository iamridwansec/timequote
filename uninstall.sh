#!/bin/bash

printf "%s\n" "Uninstalling timequote..."

if sudo rm /usr/local/bin/timequote; then
    printf "%s\n" "timequote uninstalled successfully."
else
    printf "%s\n" "Uninstallation failed."
    exit 1
fi
