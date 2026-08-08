#!/bin/bash

# Default countdown value if no argument provided
if [ $# -eq 0 ]; then
    COUNTDOWN=10
else
    # Take the first argument, validate it, and set COUNTDOWN
    COUNTDOWN=$1
    if ! [[ "$COUNTDOWN" =~ ^[0-9]+$ ]] || [ "$COUNTDOWN" -lt 1 ]; then
        echo "Error: Countdown duration must be a positive integer." >&2
        exit 1
    fi
fi

echo -e "\nStarting countdown for $COUNTDOWN seconds...\n"

# Function to display formatted time with ANSI color codes
countdown_display() {
    local mins secs
    mins=$(( COUNTDOWN / 60 ))
    secs=$(( COUNTDOWN % 60 ))
    printf "\r\33[1K"  # Clear line
    printf "Counting down: %02d:%02d" "$mins" "$secs"
}

# Update countdown every second using a loop and sleep
while true; do
    if [ $COUNTDOWN -gt 0 ]; then
        echo ""
        countdown_display
        sleep 1
        COUNTDOWN=$(( COUNTDOWN - 1 ))
    else
        # Countdown reached zero, stop the loop
        break
    fi

    # Check for interrupt signal (Ctrl+C)
    trap 'echo; exit' SIGINT
done

# Final message after countdown completes
echo "\nCountdown finished!"
