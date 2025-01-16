#!/bin/bash

##
# Configure the shell properly
##

# Check for Oh My Zsh and install if we don't have it
if ! command -v omz &> /dev/null; then

  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
else
  echo -e "\n⏭  Oh My Zsh is already installed, skip installer."
fi

# Removes .zshrc from $HOME (if it exists) and use the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
cp .zshrc $HOME/.zshrc

# Install oh-my-zsh theme
rm -rf ~/.dotfiles/zsh/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.dotfiles/zsh/themes/powerlevel10k
