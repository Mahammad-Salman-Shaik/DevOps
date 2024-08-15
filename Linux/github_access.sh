#!/bin/bash

# GitHub repository details
USERNAME="your_username"
REPO="your_repository"

# GitHub Personal Access Token for authentication
TOKEN="your_personal_access_token"

# GitHub API URL for collaborators
API_URL="https://api.github.com/repos/$USERNAME/$REPO/collaborators"

# Function to list GitHub collaborators
list_collaborators() {
    echo "Listing collaborators for $USERNAME/$REPO:"
    curl -s -H "Authorization: Bearer $TOKEN" $API_URL | jq -r '.[].login'
}

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install jq to run this script."
    exit 1
fi

# Execute the function
list_collaborators
