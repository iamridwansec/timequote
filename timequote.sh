#!/bin/bash

if [ "$1" = "--help" ]; then
    printf "%s\n" "Usage: timequote.sh [option]"
    printf "%s\n" ""
    printf "%s\n" "Options:"
    printf "%s\n" "  --help             Show this help message"
    printf "%s\n" "  --search TERM      Search quotes by theme or text"
    exit 0
fi

# Time quotes shown by default
time_quotes=(
    "Time is always moving."
    "The future is built from what you do with today."
    "You cannot hold time, only decide how to spend it."
    "Every second becomes a part of your story."
    "Time reveals what patience was building."
    "Time does not wait for you to become ready."
    "What you do with your time slowly becomes who you are."
    "Time turns small decisions into big consequences."
    "You may forget how you spent a day, but time never forgets that you spent it."
    "Time gives you moments, but what you make of them is yours."
    "Some things need time to grow, and some things need time to reveal themselves."
    "Time keeps moving even when you are standing still."
)

# Searchable quotes
quotes=(
    "Technology changes quickly, but understanding takes time."
    "The tools change. The problems remain human."
    "Knowing what a tool can do is useful. Knowing when to use it is wisdom."
    "Every system reflects the decisions of the people who built it."
    "Technology gives us speed. Understanding gives us direction."
    "Sometimes the most important part of a system is what nobody thought to question."
    "Progress is not always about building something new. Sometimes it is about understanding what already exists."

    "Security begins with questioning what everyone else accepts."
    "The weakness you overlook today may become the problem you investigate tomorrow."
    "Not every failed attack is wasted effort. Sometimes failure reveals the path forward."
    "A secure system is not one without weaknesses, but one whose weaknesses are understood."
    "The deeper you investigate, the less certain your first assumption becomes."
    "An attacker only needs one overlooked detail. A defender must understand the whole picture."
    "Security is not about knowing every answer. It is about knowing what deserves to be questioned."

    "The terminal does not hide complexity. It teaches you to understand it."
    "Linux becomes less mysterious when you stop memorizing commands and start understanding what they do."
    "A command can execute in a second. Understanding why you needed it can take much longer."
    "The terminal remembers what you tell it to do. Your understanding determines what happens next."
    "Every command is a conversation with the system."
    "Freedom in Linux comes with the responsibility to understand what you are doing."
    "Sometimes the shortest command is not the simplest solution."

    "Learning begins when you become comfortable admitting that you do not know."
    "Understanding takes longer than memorization, but it stays longer."
    "The question you ask can be more valuable than the answer you receive."
    "You do not grow by avoiding what you find difficult."
    "Knowledge gives you answers. Understanding teaches you how to find them."
    "Every mistake can become a lesson when you are willing to investigate it."
    "The more you learn, the more you realize how much remains unknown."

    "A bug is often the consequence of something you stopped questioning."
    "Debugging turns confusion into evidence."
    "The error message is not the problem. It is a clue."
    "Sometimes fixing the problem begins with understanding why it exists."
    "A system rarely breaks without leaving something behind to explain why."
    "The fastest way to solve a problem is sometimes to slow down and observe it."
    "Every failed attempt removes one possibility from the unknown."

    "Discipline is choosing what matters even when nothing is forcing you to."
    "Small actions become habits, and habits eventually become a life."
    "Motivation can begin the journey. Discipline keeps it moving."
    "What you repeatedly do with your time eventually becomes your direction."
    "Discipline is giving your future self something to thank you for."
    "Progress is often invisible while it is happening."
    "Consistency is time quietly working in your favor."

    "Failure is not always the end of an attempt. Sometimes it is the beginning of understanding."
    "A failed attempt still tells you something that success might have hidden."
    "Failure becomes useful when curiosity survives it."
    "Some lessons only appear after something goes wrong."
    "You do not waste an attempt when you learn from it."
    "Every mistake leaves behind information. Whether you use it is your choice."
    "Sometimes losing the path is how you discover another one."

    "Curiosity begins where certainty ends."
    "The ordinary becomes interesting when you start asking why."
    "A question can open a door that an answer never showed you."
    "Curiosity is the willingness to look twice."
    "The things we understand least often deserve the closest attention."
    "Investigation begins with the decision not to assume."
    "Sometimes discovery is simply refusing to stop asking why."
)

# Categories corresponding to each searchable quote
categories=(
    technology technology technology technology technology technology technology
    cybersecurity cybersecurity cybersecurity cybersecurity cybersecurity cybersecurity cybersecurity
    linux linux linux linux linux linux linux
    learning learning learning learning learning learning learning
    debugging debugging debugging debugging debugging debugging debugging
    discipline discipline discipline discipline discipline discipline discipline
    failure failure failure failure failure failure failure
    curiosity curiosity curiosity curiosity curiosity curiosity curiosity
)

print_quote() {
    quote="$1"
    width=60

    # Wrap long quotes without breaking words
    wrapped_quote=$(printf "%s\n" "$quote" | fold -s -w "$width")

    # Find the longest line
    max_length=0

    while IFS= read -r line; do
        if [ "${#line}" -gt "$max_length" ]; then
            max_length=${#line}
        fi
    done <<< "$wrapped_quote"

    # Keep the box from becoming too wide
    if [ "$max_length" -gt "$width" ]; then
        max_length=$width
    fi

    # Minimum visual width
    if [ "$max_length" -lt 30 ]; then
        max_length=30
    fi

    separator=""

    for ((i=0; i<max_length; i++)); do
        separator="${separator}-"
    done

    printf "%s\n" "$separator"

    while IFS= read -r line; do
        printf "%s\n" "$line"
    done <<< "$wrapped_quote"

    printf "%*s\n" "$max_length" "~ iamridwansec"
    printf "%s\n" "$separator"
}

if [ "$1" = "--search" ]; then
    if [ -z "$2" ]; then
        printf "%s\n" "Please provide a search term."
        exit 1
    fi

    search_term=$2
    matches=()

    for i in "${!quotes[@]}"; do
        if [[ "${quotes[$i],,}" == *"${search_term,,}"* ]] ||
           [[ "${categories[$i],,}" == *"${search_term,,}"* ]]; then
            matches+=("$i")
        fi
    done

    if [ "${#matches[@]}" -eq 0 ]; then
        printf "%s\n" "No matching quote found."
        exit 1
    fi

    random_match=$((RANDOM % ${#matches[@]}))
    random_index="${matches[$random_match]}"
    quote="${quotes[$random_index]}"

    print_quote "$quote"

    exit 0
fi

if [ -n "$1" ]; then
    printf "Unknown option: %s\n" "$1"
    printf "%s\n" "Use --help to see available options."
    exit 1
fi
# Default: show a random time quote
random_index=$((RANDOM % ${#time_quotes[@]}))
quote="${time_quotes[$random_index]}"

print_quote "$quote"
