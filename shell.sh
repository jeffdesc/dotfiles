#!/bin/bash

##
# Configure the shell properly
##

# Install oh-my-zsh theme
rm -rf ~/.dotfiles/zsh/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.dotfiles/zsh/themes/powerlevel10k
