#!/bin/bash

createUsers() {
	echo -n "Enter a username for user $1: "
	read username
	useradd -m $username
}

createUsers 1
createUsers 2

# Extracting user name from /etc/passwd
echo "The following users were added"
tail -n 2 /etc/passwd | awk -F":" '{print $1}'
