#!/bin/bash

# color
LIGHT_PURPLE='\e[1;35m' # Light Purple Color
NC='\033[0m' # No Color

# Logger
print_log() {
    local color=$1
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo ""
    echo -e "${color}==== $2 [$timestamp] ====${NC}"
    echo ""
}

# main logic
text=$1
while true; do
print_log "$LIGHT_PURPLE" "$text" >> file4.txt
sleep 5
done
