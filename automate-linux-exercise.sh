#!/bin/bash

# colors
GREEN='\033[0;32m'  # Green color
LIGHT_PURPLE='\e[1;35m' # Light Purple Colorj
NC='\033[0m' # No Color

# Loggers
print_log() {
    local color=$1
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo ""
    echo -e "${color}$2                              [$timestamp]${NC}"
}
print_statement() {
    local color=$1
    echo -e "${color}$2${NC}"
}

# Main logic
continue_loop=true
is_lab_cloned=false
while $continue_loop; do
	print_statement "$LIGHT_PURPLE" "1. Add New User"
	print_statement "$LIGHT_PURPLE" "2. Copy lab/ from interns.skript.be as username git" 
	print_statement "$LIGHT_PURPLE" "3. Find FLAG in file1.log"
	print_statement "$LIGHT_PURPLE" "4. Find Username & password & store it in credentials.txt, make that file read-only"
	print_statement "$LIGHT_PURPLE" "5. Execute execute_me.sh & Output the contents of file3.log"
	print_statement "$LIGHT_PURPLE" "6. Run a script that logs some text with current datetime into a file every 5 seconds"
	echo "Enter your choice: "
	read choice
		
	if [[ $choice == "1" ]]; then
		echo "Enter Username: "
		read username
		sudo useradd -m $username
		sudo passwd $username
	fi

	if [[ $choice != "2" && !is_lab_cloned ]]; then
		echo "Execute Task 2 before doing 3 - 6"
	elif [[ $choice == "2" ]]; then	
		scp git@interns.script.be:/home/git/lab .
		is_lab_cloned=true
	elif [[ $choice == "3" ]]; then
		grep "FLAG" file1.log
	elif [[ $choice == "4" ]]; then
		echo "To implement"
		grep -E "USERNAME|PASSWORD" file2.log >> creds.txt
		chmod 444 creds.txt
	elif [[ $choice == "5" ]]; then
		cd ./lab
		chmod +x execute_me.sh
		./execute_me.sh
		sudo cat file3.log
	elif [[ $choice == "6" ]]; then
		echo "To implement"
	else 
		echo "Choice rejected"
	fi
	
	echo "Continue? (y/n): "
	read ch
	response_lower=$(echo "$ch" | tr '[:upper:]' '[:lower:]')
	if [[ $response_lower == "n" ]]; then
		continue_loop=false
	fi
done

