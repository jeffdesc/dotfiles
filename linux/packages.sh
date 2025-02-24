#!/bin/bash

# Update apt recipes
echo -e "\n🍺  Configuring APT to my liking..."
sudo apt update
sudo apt upgrade

sudo apt install -y \
  build-essential \
  apt-transport-https \
  ca-certificates \
  gnupg \
  software-properties-common \
  git \
  jq \
  curl \
  yq \
  dnsutils \
  telnet \
  mtr \
  dos2unix \
  icdiff \
  gh \
  whois \
  vim \
  uidmap \
  libbtrfs-dev

# Install brew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  echo -e "\n⏭  Brew is already installed, skip installer."
fi

# Brew packages
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Install ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
