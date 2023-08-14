#!/bin/bash

#################
# Author: Prashant Negi
# Date: 14 August 2023
#
# Purpose: Install docker and add the current user to the docker group
# Version: V1
################


# sets script in debug mode
set -x

# exit immediately if any command fails
set -e

# To check if the script is executed using root user privileges
# EUID --> Effective user id, the EUID of root user is 0
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Updating the system"
apt update

echo "Installing docker"
apt install docker.io -y

# Grant access to your user to run docker commands
usermod -aG docker $USER

echo "Docker is successfully installed and the \
current user has been added to the docker group"
