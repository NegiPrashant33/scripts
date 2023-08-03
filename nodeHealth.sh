#########################
# Author: Prashant Negi
# Date: 12/07/2023
#
# Purpose: This script output the node health
#
# Version: V1
#########################

set -x # Debug mode
set -e # Exit the script when there is an error
set -o pipefail

df -h

free -g

nproc

# Print the process ids of the process firefox
ps -ef | grep firefox | awk -F" " '{print $2}'
