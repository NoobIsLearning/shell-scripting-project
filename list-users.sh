#!/bin/bash

##############
#Author: Roy
#Date: 10/7/2024
##############

# This script will list all users who have access to given repository

set -x
set -eo pipefail

# Github API URL
API_GITHUB = "https://api.github.com"

# Username and personal github access token
USERNAME=$username
TOKEN=$token

# Github repository information
REPO_OWNER=$1
REPO_NAME=$2

function github_api_get {
  local endpoint="$1"
  local url="${API_GITHUB}/${endpoint}"

  # Send GET request to the github API with authentication
  curl -s -u "${SERNAME}:${TOKEN}" "${url}"
}

function list_user_with_read_access {
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
  
  # fetch the list of collaborators on this repo
  collaborators="$(github_api_get "endpoint" | jq -r '.[] | select(.permission.pull==true) | .login')"

  # Display collaborators with read access
  if [[ -z "$collaborators"]]; then
    echo "No users with read access found for Repo: ${REPO_OWNER}/${REPO_NAME}"
  else
    echo "Repo: ${REPO_OWNER}/${REPO_NAME}"
    echo "Users with read access:"
    echo "$collaborators"
  fi
}

# Main
echo "Listing users with read access on Repo: ${REPO_OWNER}/${REPO_NAME}"
list_user_with_read_access
