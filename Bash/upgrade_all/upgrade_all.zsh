#!/bin/zsh
# License: GPL

echo "\033[34m============ zplug ============\033[0m"
source ~/.zshrc
zplug update

echo "\033[34m============ macOS ============\033[0m"
softwareupdate --install --all

echo "\033[34m============ Mac App Store ============\033[0m"
mas upgrade

echo "\033[34m============ Homebrew ============\033[0m"
brew update
brew upgrade
brew cask upgrade
