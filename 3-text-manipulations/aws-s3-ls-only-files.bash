#!/usr/bin/env bash

# Fail on error
set -e
# Fail on undefined variables
set -u

BUCKET=$1
FOLDER=$2

# find zip files, convert to lowercase and print out in alphabetical order
aws s3 ls s3://${BUCKET}/${FOLDER}/ | grep '\.zip$' | awk '{print $4}'  | tr '[:upper:]' '[:lower:]' | sort

