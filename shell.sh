#!/bin/bash

##
# Configure the shell properly
##

# Install oh-my-zsh theme
rm -rf $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Install required fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline-fonts
cd /tmp/powerline-fonts
./install.sh
cd ../
rm -rf /tmp/powerline-fonts
