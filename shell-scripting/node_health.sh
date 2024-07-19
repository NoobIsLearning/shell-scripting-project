#!/bin/bash

###################
# Author: Roy
# Date: 5/7/2024
###################

# Version: 1

# Display Nodes Health

set -x # debug mode
set -e # exit the script when there is an error
set -o pipefail

# set -exo pipefail

df -h

free --mega

nproc

ps -ef | grep amazon | awk -F" " '{print $2}'
