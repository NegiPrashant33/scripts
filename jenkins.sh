#!/bin/bash

#################
# Author: Prashant Negi
# Date: 16 August 2023
#
# Purpose: Install java and jenkins
# Version: V1
#################


# Script set to debug mode
set -x

# Exit the script if any command fails
set -e

if [[ $EUID -ne 0 ]]; then
	echo "Script requires root user previliges"
	exit 1
fi


apt update

echo "Installing java"
apt install openjdk-17-jre -y

echo "Installing jenkins"
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update

apt-get install jenkins -y

echo "Jenkins successfully installed"
