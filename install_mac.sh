#!/bin/bash

echo -e "\n💻  Start configuring your Mac... "

# Check for Oh My Zsh and install if we don't have it
if ! command -v omz &> /dev/null; then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
else
  echo -e "\n⏭  Oh My Zsh is already installed, skip installer."
fi

# Check for Homebrew and install if we don't have it
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo -e "\n⏭  Brew is already installed, skip installer."
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
cp .zshrc $HOME/.zshrc

# Update Homebrew recipes
echo -e "\n🍺  Configuring Brew to my liking..."
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Make sure 1Password is configured before proceeding
echo -e "\n🔑  Make sure 1Password is configured before proceeding."
echo -e "      - Add your account with your secrets"
echo -e "      - Go to Settings > Developer > Connect with 1Password CLI"
echo -e "\n\n   Select 'y' when 1Password is installed, choose: [y/n]"
read select_op

# Keys folder location
KEYS_FOLDER="~/.keys"
# Create the folder
mkdir -p ${KEYS_FOLDER};

if [[ $select_op == 'y' ]]; then
  # Add keys from 1Password to our local machine
  ./keys.sh
else
  echo "❌  Aborted SSH key configuration from 1Password. Please re-run to configure the SSH keys."
fi

# Copy iterm2 files
mkdir -p "$HOME/Library/Application Support/iTerm2/DynamicProfiles"
cp iterm2/dark_agnoster.json "$HOME/Library/Application Support/iTerm2/DynamicProfiles"

# Install oh-my-zsh theme
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set macOS preferences - we will run this last because this will reload the shell
# source ./.macos
