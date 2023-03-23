#!/bin/bash

##
# Create the keys directory and add the keys in there from 1 Password
##
KEYS_FOLDER="~/.keys"

# Login on 1 Password
op signin;

# Get all the keys tagged as 'ssh' and write those files as a key file
op item list --tags ssh --format json | op item get - --format json | jq -c | while read i; do
  SSH_TITLE=`echo "${i}" | jq '.title' -r`;
  SSH_KEY=`op item get ${SSH_TITLE} --format json | jq '.fields[] | select(.id == "private_key") | .value' -r`;
  KEY_FILE="${KEYS_FOLDER}/${SSH_TITLE}.load";
  echo -e "Wrote key '$SSH_TITLE' to '${KEY_FILE}'";
  echo "${SSH_KEY}" > ${KEY_FILE};
done

# Change the file permissions for the keys with the correct location
chmod -R 0600 $KEYS_FOLDER/*;

