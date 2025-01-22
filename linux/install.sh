#!/bin/bash

echo -e "\n💻  Start configuring your Linux... "

# Install packages
./packages.sh

# # Make sure 1Password is configured before proceeding
# echo -e "\n🔑  Make sure 1Password is configured before proceeding."
# echo -e "      - Add your account with your secrets"
# echo -e "      - Go to Settings > Developer > Connect with 1Password CLI"
# echo -e "\n\n   Select 'y' when 1Password is installed, choose: [y/n]"
# read select_op

# Keys folder location
KEYS_FOLDER="${HOME}/.keys"
# Create the folder
mkdir -p ${KEYS_FOLDER};

# if [[ $select_op == 'y' ]]; then
#   # Add keys from 1Password to our local machine
#   ./keys.sh
# else
#   echo "❌  Aborted SSH key configuration from 1Password. Please re-run to configure the SSH keys."
# fi

# # Create personal folders
# mkdir -p $WORK $PROJECTS $LOC_GIT

# Configure the Shell
./shell.sh

# Install k9s plugins
mkdir -p ~/.config/k9s
cp k9s/plugins.yaml ~/.config/k9s/plugins.yaml
