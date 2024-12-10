#!/bin/bash

clear # Clear the terminal

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
DARK_BROWN="\e[38;5;94m" # Darker brown for the trunk
RESET="\e[0m"
STAR="\e[38;5;220m★\e[0m"

# Calculate days until Christmas
current_date=$(date +%s)
christmas_date=$(date -d "Dec 25 $(date +%Y)" +%s)
days_until_christmas=$(( (christmas_date - current_date) / 86400 ))

# Tree design
TREE=(
"         ${STAR}        "
"        ${GREEN}/ \\ ${RESET}       "
"       ${GREEN}/ o \\ ${RESET}      "
"      ${GREEN}/ o o \\ ${RESET}     "
"     ${GREEN}/ o o o \\ ${RESET}    "
"    ${GREEN}/ o o o o \\ ${RESET}   "
"   ${GREEN}/ o o o o o \\ ${RESET}  "
"  ${GREEN}/ o o o o o o \\ ${RESET} "
"   ${DARK_BROWN}|||${RESET}        "
"   ${DARK_BROWN}|||${RESET}        "
)

# Array of colors to cycle through for the lights
COLORS=(
    "\e[38;5;196m"  # Bright Red
    "\e[38;5;46m"   # Bright Green
    "\e[38;5;226m"  # Yellow
    "\e[38;5;208m"  # Orange
    "\e[38;5;93m"   # Pinkish Purple
    "\e[38;5;21m"   # Bright Blue
    "\e[38;5;117m"  # Sky Blue
    "\e[38;5;45m"   # Aqua
    "\e[38;5;220m"  # Gold
    "\e[38;5;201m"  # Hot Pink
    "\e[38;5;118m"  # Lime Green
    "\e[38;5;129m"  # Deep Magenta
    "\e[38;5;34m"   # Forest Green
    "\e[38;5;15m"   # White
    "\e[38;5;202m"  # Deep Orange
)

# Function to display the tree
display_tree() {
    # Move the cursor to the top of the terminal
    tput civis # Hide cursor
    tput cup 0 0
    for line in "${TREE[@]}"; do
        echo -e "$line"
    done
    echo -e "\n${GREEN}Merry Christmas and\nHappy Coding!${RESET}"
    echo -e "${YELLOW}Days until Christmas: $days_until_christmas${RESET}"
}

# Function to update the lights in the tree
update_lights() {
    local color_index="$1"
    TREE=(
"         ${STAR}        "
"        ${GREEN}/ \\ ${RESET}       "
"       ${GREEN}/ ${COLORS[color_index]}o${GREEN} \\ ${RESET}      "
"      ${GREEN}/ ${COLORS[(color_index+1)%5]}o${RESET} ${COLORS[(color_index+2)%5]}o${GREEN} \\ ${RESET}     "
"     ${GREEN}/ ${COLORS[(color_index+2)%5]}o${RESET} ${COLORS[color_index]}o${RESET} ${COLORS[(color_index+1)%5]}o${GREEN} \\ ${RESET}    "
"    ${GREEN}/ ${COLORS[(color_index+1)%5]}o${RESET} ${COLORS[(color_index+2)%5]}o${RESET} ${COLORS[color_index]}o${RESET} ${COLORS[(color_index+1)%5]}o${GREEN} \\ ${RESET}   "
"   ${GREEN}/ ${COLORS[(color_index+2)%5]}o${RESET} ${COLORS[(color_index+1)%5]}o${RESET} ${COLORS[(color_index+2)%5]}o${RESET} ${COLORS[color_index]}o${RESET} ${COLORS[(color_index+1)%5]}o${GREEN} \\ ${RESET}  "
"  ${GREEN}/ ${COLORS[(color_index+1)%5]}o${RESET} ${COLORS[(color_index+2)%5]}o${RESET} ${COLORS[color_index]}o${RESET} ${COLORS[(color_index+1)%5]}o${RESET} ${COLORS[(color_index+2)%5]}o${RESET} ${COLORS[color_index]}o${GREEN} \\ ${RESET} "
"        ${DARK_BROWN}|||${RESET}        "
"        ${DARK_BROWN}|||${RESET}        "
)
}

# Main loop to animate the lights
trap 'tput cnorm; clear' EXIT # Restore cursor and clear screen on exit
color_index=0
while true; do
    update_lights "$color_index"
    display_tree
    color_index=$(( (color_index + 1) % 3 ))
    sleep 1.5 # Light changes every 2 seconds
done

